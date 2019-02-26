'''
Created on Sep 2, 2011

@author: carlos
'''

import types
from pybrain.structure.modules import KohonenMap

class SOM(KohonenMap):
    """
        This class is basically a wrapper for Kohonen.py from pybrain
        THe main additional feature is callback handlers
    """
    
    def __init__(self, inputs, outputs, data, name=None, outputFullMap=False):
        # initiate the KohonenMap
        KohonenMap.__init__(self, inputs, outputs, name, outputFullMap)
        
        # data representing feature space/dimensions
        self.data = data
        
        #keep a list of callbacks
        self._messageHandlers = []
        
    # receive call back registration
    def addMessageHandler(self, handler):
        if type(handler) not in (types.FunctionType, types.MethodType):
            raise TypeError("Message callback '%s' is not callable" % repr(handler))
        else:
            self._messageHandlers.append(handler)

    # notify listeners/observers
    def notifyHandlers(self, data):
        for somCallback in self._messageHandlers:
            somCallback(data)

    
    
