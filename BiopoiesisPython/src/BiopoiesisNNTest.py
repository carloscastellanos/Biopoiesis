'''
Created on Aug 21, 2011

@author: carlos
'''
#!/usr/bin/python

from OSC import OSCClient, OSCServer, OSCMessage
from time import sleep
from pyfann import libfann
import types

class BiopoiesisNNTest():
    '''
    classdocs
    
    some of this code is based upon this example:
    http://gitorious.org/pyosc/devel/blobs/master/examples/knect-rcv.py
    '''
    
    # Override  __init__ method to accept the parameters needed:
    def __init__ (self, host, sendport, receiveport):
        self.host = host
        self.sendport = sendport
        self.receiveport = receiveport
        
        # OSC addresses
        self.sendAddress = "/nn" # send data from the neural network
        self.receiveAddress = "/solution" #receive data from the electrochemical solution
        
        # OSC client & server
        self.client = OSCClient();
        self.server = OSCServer((self.host, self.receiveport));
        
        self.running = True
        self.connected = False;
        
        #neural net
        self.ann = libfann.neural_net()
        self.ann.create_from_file("biopoiesis_nn.net")
        

    def run(self):
        """
        """
        while self.running:
            if not self.connected:
                if self.oscConnect() == False:
                    self.connected = False
                    print("Error making an OSC/UDP socket to " + str(self.host) + ":" + str(self.sendport));
                    print("Will try again in 10 seconds");
                    sleep(10)
                else:
                    self.connected = True
                    self.serverHandleRequests()

        if self.connected:
            self.oscDisconnect()
    
        print ("*** BiopoiesisNNTest stopped. ***");
        

    ########### callback #############
    # this method of reporting timeouts only works by convention
    # that before calling handle_request() field .timed_out is
    # set to False
    def handle_timeout(self):
        self.timed_out = True
    
    ########### callback #############
    # OSC messages received
    def messageReceived(self, addr, tags, args, source):
        if addr == self.receiveAddress:
            if args[0] == "quit":
                print "Quitting..."
                self.running = False;
                return
            # assume we have four args that we're reading (for four electrodes)
            t = (args[0], args[1], args[2], args[3])
            print "incoming data: " + str(t)
            #self.nnExecute(t)

    
    # OSC connect/sendClient
    def oscConnect(self):
        ### register callbacks ###
        try:
            #server
            # funny python's way to add a method to an instance of a class
            self.server.handle_timeout = types.MethodType(self.handle_timeout, self.server)
            self.server.addMsgHandler( self.receiveAddress, self.messageReceived )
            
            # connect to sendClient & send a message
            self.client.connect( (self.host, self.sendport) )
            msg = OSCMessage(self.sendAddress)
            msg.append(1) 
            self.client.send( msg )
            return True
        except Exception, e:
            print e
            return False
        

    # OSC discconnect
    def oscDisconnect(self):
        try:
            self.client.send( OSCMessage(self.oscAddress, [0] ) )
            self.client.close()
            self.connected = False
        except:
            pass


    def serverHandleRequests(self):
        # clear timed_out flag
        self.server.timed_out = False
        
        # handle all pending requests then return
        while not self.server.timed_out and self.running:
            self.server.handle_request()
            
        
    def nnExecute(self, params):
        """ run input through the network """
        
        calcout = self.ann.run(params)
        
        print calcout
        

        
