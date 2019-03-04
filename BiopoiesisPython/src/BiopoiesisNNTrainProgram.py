'''
Created on Aug 22, 2011

@author: carlos
'''
#!/usr/bin/python

import sys
from BiopoiesisNNTrain import BiopoiesisNNTrain

if len(sys.argv) != 4:  # the program name and the three arguments
    # stop the program and print an error message
    sys.exit("Must provide a hostname or IP, a send port and a receive port")

# host and ports
host = sys.argv[1]
sendport = int(sys.argv[2])
receiveport = int(sys.argv[3])

runner = BiopoiesisNNTrain(host, sendport, receiveport)
runner.run()
print "BiopoiesisNNTestProgram quit."