/**
 * 
 */
package org.dprime.biopoiesis;

import java.awt.EventQueue;
import java.awt.Toolkit;


/**
 * @author carlos
 *
 */
public class Biopoiesis
{
	private static BiopoiesisRunner runner;
	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		// Setup custom event trapping (to trap escape key globally)
		// NOTE: this won't work with MS Jview (comment out if running in that JRE)
		// NOTE: this interferes with Alt-F4 key (OS key to close window)
		// thanks to Mark Napier for this code
		EventQueue eq = Toolkit.getDefaultToolkit().getSystemEventQueue();
		eq.push(new BiopoiesisEventQueue());
		
		String host;
		int sendport;
		int rcvport;
		int somNumInputs;
		if((args.length != 4)) {
			throw new IllegalArgumentException
			("Usage: Biopoiesis <host> <send port> <receive port> <num inputs to som>");
		} else {
			host = args[0];
			sendport = Integer.parseInt(args[1]);
			rcvport = Integer.parseInt(args[2]);
			somNumInputs = Integer.parseInt(args[3]);
        }
		
		runner = new BiopoiesisRunner(host, sendport, rcvport, somNumInputs);
		runner.start();
		System.out.println("Biopoiesis quit.");
	}

}
