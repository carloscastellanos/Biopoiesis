/**
 * 
 */
package org.dprime.biopoiesis;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.channels.DatagramChannel;

import org.neuroph.core.learning.TrainingSet;

import de.sciss.net.OSCListener;
import de.sciss.net.OSCMessage;
import de.sciss.net.OSCPacket;
import de.sciss.net.OSCReceiver;
import de.sciss.net.OSCTransmitter;
/**
 * @author carlos
 *
 */
public class BiopoiesisRunner extends Thread implements OSCListener
{
	// --- OSC stuff --- //
    private OSCTransmitter oscTransmitter = null;
    private OSCReceiver oscReceiver = null;
    private InetSocketAddress sendAddr;
    private InetSocketAddress rcvAddr;
    private DatagramChannel dchSend = null;
    private DatagramChannel dchRcv = null;
    private int sendPort;
    private int receivePort;
	static final int SEND_PORT = 59999; //default
	static final int RECEIVE_PORT = 59998; //default
    private String host = null;
    private boolean isConnected = false;
    private static final String oscSendAddr = "/nn";// send data from the neural network
    private static final String oscReceiveAddr = "/solution"; // receive data from the electrochemical solution
	
    // Neural Network stuff
    // kohonen neural network with 8 inputs (for 8 electrodes)
    private static final int SOM_NUM_INPUTS = 8;
    private int someNumInputs;
    private TrainingSet trainingSet = new TrainingSet();
    // create kohonen neural network
    NeuralNetwork som = new Kohonen(new Integer(8), new Integer(100));
    
	public BiopoiesisRunner(String host, int sendport, int rcvport, int somNumInputs) {
    	this.host = host;
    	this.sendPort = sendport;
    	this.receivePort = rcvport;
    	this.someNumInputs = somNumInputs;
	}
	
	public BiopoiesisRunner(String host) {
		// default ports
		this(host, SEND_PORT, RECEIVE_PORT, SOM_NUM_INPUTS);
	}
	
	public void messageReceived(OSCMessage msg, SocketAddress sender, long time) {
		// get the address pattern of the msg
		String oscMsgName = msg.getName();
		System.out.println("OSC msg received: " + oscMsgName);
		
		if(oscMsgName.equalsIgnoreCase(oscReceiveAddr)) {
			if ( ((String)msg.getArg(0)).equalsIgnoreCase("quit") ) {
				System.out.println("Quitting...");
                this.interrupt();
                return;
			}
			
			// each arg is an electrode
            for (int i=0; i<msg.getArgCount(); i++) {
                System.out.println(msg.getArg(i));
            }

            //nnExecute(t);
		}
		
		
	}
	
	public void run() {
		System.out.println("*** BiopoiesisRunner started... ***");
		// Get socket via OSC/UDP
		while(!Thread.interrupted()) {
			if(!isConnected) {
				if(oscConnect() == false) {
					isConnected = false;
					System.out.println("Error making an OSC/UDP socket to " + this.host + ":" + sendPort);
					System.out.println("Will try again in 10 seconds");
					try {
						Thread.sleep(10000);  // retry in 10 secs
					} catch (InterruptedException iex) {
						System.out.println("D'oh!.  Thread " + this + " was interrupted: " + iex);
					}
				} else {
					isConnected = true;
				}
			}
		} // end while
		if(isConnected)
			oscDisconnect();
	}
	
	private boolean oscConnect() {
		if(isConnected)
			return true;
		
		boolean success;
		try {
			InetAddress localhost = InetAddress.getLocalHost();
			dchRcv = DatagramChannel.open();
			dchSend = DatagramChannel.open();
			// assign an automatic local socket address
			rcvAddr = new InetSocketAddress(localhost, receivePort);
			sendAddr = new InetSocketAddress(this.host, sendPort);
			dchRcv.socket().bind(rcvAddr);
			oscReceiver = OSCReceiver.newUsing(dchRcv);
			oscReceiver.addOSCListener(this);
			oscReceiver.startListening();
			oscTransmitter = OSCTransmitter.newUsing(dchSend);
			OSCMessage connect = new OSCMessage(oscSendAddr, new Object[]{new Integer(1)});
			sendOSC(connect);
			System.out.println("Sending OSC message: " + oscSendAddr);
			System.out.println("*** OSC connection successful ***");
			success = true;
		} catch(IOException ioe) {
			System.out.println("*** OSC connection error! ***");
			System.out.println(ioe);
			success = false;
		}
		return success;
	}
	
	private void oscDisconnect() {
		// stop/close the OSC
		OSCMessage disconnect = new OSCMessage(oscSendAddr, new Object[]{new Integer(0)});
		sendOSC(disconnect);
		
		if(oscReceiver != null) {
			try {
				oscReceiver.stopListening();
            } catch(IOException e0) {
            }
        }
        if(dchRcv != null) {
        		try {
        			dchRcv.close();
        		} catch(IOException e1) {
        		}
        }
        if(dchSend != null) {
    		try {
    			dchSend.close();
    		} catch(IOException e2) {
    		}
        }
        System.out.println("*** OSC disconnection successful ***");
	}
	
	public void sendOSC(OSCPacket oscPacket) {
		if(oscTransmitter != null && sendAddr != null) {
			try {
				oscTransmitter.send(oscPacket, sendAddr);
				System.out.println("=== OSC Message sent:" + oscPacket.toString() + " ===");
			} catch(IOException ioe) {
				System.out.println("*** Error sending OSC/UDP message! *** " + ioe);
			}
		}
	}
}
