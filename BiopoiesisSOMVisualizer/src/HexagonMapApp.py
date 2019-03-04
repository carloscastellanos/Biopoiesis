'''
Created on Sep 2, 2011

@author: carlos
'''

from HexagonMap import HexagonMap
from pybrain.structure.modules import KohonenMap
from sqlite3 import dbapi2 as sqlite
import sys,pygame
from pygame.locals import *
from scipy import random
import psyco
psyco.full()

if len(sys.argv) != 5:  # the program name and the 3 arguments
    # stop the program and print an error message
    sys.exit("Usage: " + 
        "HexagonMapApp <numInputs> <numOutputs> <db file path> <learningRate>\n")

somInputs = int(sys.argv[1])
somOutputs = int(sys.argv[2])
dbPath = str(sys.argv[3])
learningRate = float(sys.argv[4])

def getData():
    connection = sqlite.connect(dbPath)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM vectors")
    return cursor.fetchall()

def run():    
    # init the HexagonMap object (which initiates pygame)
    hexmap = HexagonMap(gridSize=(somOutputs,somOutputs))
    hexmap.initMap()

    # Used to manage how fast the screen updates
    #clock = pygame.time.Clock()
        
    fullscreen = False
                
    #Loop until the user presses the escape button (or otherwise quits).
    done = False

    while done==False:

        # Limit to 15 frames per second
        #clock.tick(15)

        ###########################
        # Key events for quitting #
        # & setting fullscreen    #
        ###########################
        for event in pygame.event.get(): # User did something
            if event.type == QUIT: # If user clicked close
                done=True # Flag that we are done so we exit this loop

        if hexmap.keyPressed(K_ESCAPE):
            done = True
        # toggle fullscreen and cursor on/off
        elif hexmap.keyPressed(K_f):
            if not fullscreen:
                hexmap.fullScreen(True)
                fullscreen = True
            else:
                hexmap.fullScreen(False)
                fullscreen = False
        elif hexmap.keyPressed(K_SPACE):
            hexmap.createSimilarityMap() # this is only for testing


        ###############################
        # Database and SOM operations #
        ###############################
        # get data from DB (all the rows)
        rows = getData()

        # initialize SOM object
        som = KohonenMap(somInputs, somOutputs, name="HexagonMap", outputFullMap=False)
        # set the learning rate (should this be a command line arg?)
        som.learningrate = learningRate

        # Do SOM operations here
        # do as many iterations as there is DB entries/images
        #=======================================================================
        # for i in range(rows):
        #    # 8 feature vectors
        #    data = [rows[i][1], rows[i][2], rows[i][3], rows[i][4], rows[i],[5], rows[i][6], rows[i][7], rows[i][8]]
        #    # one forward and one backward (training) pass
        #    som.activate(data) # feature vectors go here
        #    som.backward() # training
        #=======================================================================
        for i in range(100):
            som.activate(random.random(somInputs))
            som.backward()

            #===================================================================
            # # print & display every 10th step
            # if i % 10 == 0:
            #    print som.neurons
            #    print "======================"
            #===================================================================
                
            # send data to update the hex map
            hexmap.createSimilarityMap(som.neurons)


def main():
    # run it!
    run()
    # exit when done
    sys.exit()

#this calls the 'main' function when this script is executed
if __name__ == '__main__': main()


