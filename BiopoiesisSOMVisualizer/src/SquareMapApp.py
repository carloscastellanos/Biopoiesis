'''
Created on Sep 2, 2011

@author: carlos
'''
from SquareMap import SquareMap
from pybrain.structure.modules import KohonenMap
from sqlite3 import dbapi2 as sqlite
import sys, pygame
from pygame.locals import *
from scipy import random
import psyco
psyco.full()


if len(sys.argv) != 6:  # the program name and the 5 arguments
    # stop the program and print an error message
    sys.exit("Usage: " + 
        "SquareMapApp <numInputs> <numOutputs> <db file path> <learningRate> <images flag>" + 
        "(1 if an image similarity map is desired, 0 if a grayscale 'blobs' similarity map is desired)\n")

somInputs = int(sys.argv[1])
somOutputs = int(sys.argv[2])
dbPath = str(sys.argv[3])
learningRate = float(sys.argv[4])
imgFlag = int(sys.argv[5])


def getData():
    connection = sqlite.connect(dbPath)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM vectors")
    return cursor.fetchall()
    
def run():
    # init the SquareMap object (which initiates pygame)
    if imgFlag == 0:
        # if its a grayscale similarity map use a small grid square size
        squaremap = SquareMap(gridSize=(somOutputs, somOutputs), gridSquareSize=(5, 5))
    else:
        squaremap = SquareMap(gridSize=(somOutputs, somOutputs))
    squaremap.initMap()
    
    # Used to manage how fast the screen updates
    #clock = pygame.time.Clock()
        
    fullscreen = False
                    
    #Loop until the user presses the escape button (or otherwise quits).
    done = False

    while done == False:

        # Limit to 15 frames per second
        #clock.tick(15)
    
        ###########################
        # Key events for quitting #
        # & setting fullscreen    #
        ###########################
        for event in pygame.event.get():
            if event.type == QUIT:
                done = True
        if squaremap.keyPressed(K_ESCAPE):
            done = True
        # toggle fullscreen and cursor on/off
        elif squaremap.keyPressed(K_f):
            if not fullscreen:
                squaremap.fullScreen(True)
                fullscreen = True
            else:
                squaremap.fullScreen(False)
                fullscreen = False
        elif squaremap.keyPressed(K_SPACE):
            # load and place the images
            squaremap.placeImages() # this is only for testing


        ###############################
        # Database and SOM operations #
        ###############################
        # get data from DB (all the rows)
        rows = getData()
        imgPath = ""
    
        # initialize SOM object
        som = KohonenMap(somInputs, somOutputs, name="SquareMap", outputFullMap=False)
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
            # if i % 1 == 0:
            #    print som.neurons
            #    print "======================"
            #===================================================================
  
            # send data to update the square map
            # if images we selected at the command line do an image similarity mapping
            #otherwise do a grayscale 'blobs' similarity map
            if imgFlag == 0:
                squaremap.createSimilarityMap(som.neurons)
            else:
                #send the current img file path and the coords of the winner neuron along w/SOM's output
                imgPath = rows[i][10]
                squaremap.placeImages(som.neurons, imgPath, som.winner)



def main():
    # run it!
    run()
    # exit when done
    sys.exit()

#this calls the 'main' function when this script is executed
if __name__ == '__main__': main()






