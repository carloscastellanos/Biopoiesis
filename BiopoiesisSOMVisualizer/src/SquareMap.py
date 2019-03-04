'''
Created on Sep 2, 2011

@author: carlos
'''

import pygame, sys, os
from pygame.locals import *
from math import sqrt
from scipy import zeros
import psyco
psyco.full()

#### For similarity map ###
# How many neighbors are used in the calculation of the
# similarity map, the more the higher the quality
SIMWEIGHT  = 3;


class SquareMap(object):

    def __init__(self, bg=(0,0,0), gridSize=(40,40), gridSquareSize=(40,40)):
        # background color
        self.bgcolor = bg
        # default can hold 1600 images/color squares
        self.gridSize = gridSize
        # size of square that hold the image/color
        self.gridSquareSize = gridSquareSize
        
        
    def keyPressed(self, inputKey):
        keysPressed = pygame.key.get_pressed()
        if keysPressed[inputKey]:
            return True
        else:
            return False       


    def fullScreen(self, fs):
        if fs==True:
            self.screen = pygame.display.set_mode(self.size, pygame.FULLSCREEN)
            pygame.mouse.set_visible(False)
        else:
            self.screen = pygame.display.set_mode(self.size)
            pygame.mouse.set_visible(True)
        # update display
        pygame.display.flip()
        

#    def setupGrid(self):
#        self.gridimg = pygame.Surface((self.size[0],self.size[1]),1)
#        self.gridimg = self.gridimg.convert()
#        # same bg color as the screen bg
#        self.gridimg.fill (self.bgcolor)
#
#        # draw the grid lines
#
#        # make them light gray
#        glcolor = (204,0,0)
#
#        # vertical lines...
#        pygame.draw.line (self.gridimg, glcolor, (100,0), (100,300), 1)
#        pygame.draw.line (self.gridimg, glcolor, (200,0), (200,300), 1)
#
#        # horizontal lines...
#        pygame.draw.line (self.gridimg, glcolor, (0,100), (300,100), 1)
#        pygame.draw.line (self.gridimg, glcolor, (0,200), (300,200), 1)
#
#        return self.gridimg


    def placeImages(self, somdata, img, winner):

        """
        Place the images
        """
        
        # TODO
        # To compute similarity map take winner neuron and put the current image (img)
        # onto that x/y coord. Then for each of the other neurons try to find an img
        # in the db whose feature vectors most closely match that neuron's x/y coords
        # and place that img on the neuron's coords

        # place images to assigned coordinates or generate random ones
        if somdata == None:
            #assign random images
            myimages = [["" for col in range(self.gridSize[1])] for row in range(self.gridSize[0])]
            for imgX in range(len(myimages)):
                for imgY in range(len(myimages[imgX])):
                    myimages[imgX][imgY] = "img.jpg"
        else:
            # these come from a data structure representing the SOM's values
            myimages = somdata

        # TODO : a similarity map for the images
        for x in range(len(myimages)):
            for y in range(len(myimages[x])):
                # get the image
                img = pygame.image.load(os.path.join('', myimages[x][y]))

                # Get the top left location of the img.
                pixelX,pixelY = self._gridMapToPixel(x,y)
                
                # Blit the image to the screen
                self.screen.blit(img, (pixelX,pixelY))
                
        # update the display
        pygame.display.flip()

    def createSimilarityMap(self, data):
        """ generates a grayscale similarity map """
        """  Based upon Java code by Tom Germano:
        http://davis.wpi.edu/~matt/courses/soms/ """
        
        t_map = zeros((self.gridSize[0], self.gridSize[1]), dtype=float) # temp buffer for calculated distances
        
        max_dist = 0.0
        
        for x in range(len(data)):
            for y in range(len(data[x])):
                center = data[x][y]
                numinave = 0
                total = 0.0
                
                #total up the distances
                for xx in range(-SIMWEIGHT,SIMWEIGHT+1,1):
                    for yy in range(-SIMWEIGHT,SIMWEIGHT+1,1):
                        if xx+x>=0 and xx+x<len(data) and yy+y>=0 and yy+y<len(data[x]):
                            total+= self._getDistance(data[x+xx][y+yy],center)
                            numinave+=1
                
                #-1 is for the center
                total/=(numinave-1)
                if total>max_dist:
                    max_dist=total;
                    
                # Put all the totals into a buffer for later scaling
                t_map[x][y]=total;
        
        # The colors here are scaled in order to use all the colors
        #total=0.0
        for x in range(len(data)):
            for y in range(len(data[x])):
                tmpColor = 255-round((t_map[x][y]/max_dist)*255.0)
                
                # Get the top left location of the square
                pixelX,pixelY = self._gridMapToPixel(x,y)
                
                # create the square & fill it
                square = pygame.Surface((self.gridSquareSize[0], self.gridSquareSize[1]))
                square.fill((tmpColor,tmpColor,tmpColor))
                
                # Blit the square to the screen
                self.screen.blit(square, (pixelX,pixelY))
        
        # update the display
        pygame.display.flip()

    
    def _getDistance(self, outer, center):
        d = zeros(len(center), dtype=float) # center & outer are the same length so either works
        for dd in range(len(d)):
            d[dd] = outer[dd] - center[dd]
            # now square these values
            d[dd] *= d[dd]
            
        # now add all of these values
        final = 0
        for ddd in range(len(d)):
            final += d[ddd]
            
        # now get the square root
        return sqrt(final)
    
              
    def _gridMapToPixel(self, mapX, mapY):
        return (mapX * self.gridSquareSize[0], mapY* self.gridSquareSize[1])


    def _init(self):
        """
        Setup the screen etc.
        """
        
        print "=== Starting SquareMap... ==="
        
        w = self.gridSize[0] * self.gridSquareSize[0]
        h = self.gridSize[1] * self.gridSquareSize[1]
        self.size=(w,h)
        self.screen = pygame.display.set_mode(self.size)
        pygame.display.set_caption('Biopoiesis SOM Image Grid')
        self.screen.fill(self.bgcolor) # Set the screen background

        # font
        #default_font = pygame.font.get_default_font()
        #font = pygame.font.SysFont(default_font, 22)
    
        # set up the Surface to hold the images
        self.mapimg = pygame.Surface((self.size[0],self.size[1]),1)
        self.mapimg = self.mapimg.convert()
        self.mapimg.fill(self.bgcolor)

        #setup the grid
        #self.setupGrid()
        
    def initMap(self):
        # init pygame
        pygame.init()
        self._init()
    
    def run(self):
        self.initMap()

        # Used to manage how fast the screen updates
        clock = pygame.time.Clock()
        
        fullscreen = False
                
        #Loop until the user presses the escape button (or otherwise quits).
        done = False

        while done==False:

            # Limit to 15 frames per second
            clock.tick(15)

            for event in pygame.event.get():
                if event.type == QUIT:
                    done = True

            if self.keyPressed(K_ESCAPE):
                done = True
            # toggle fullscreen and cursor on/off
            elif self.keyPressed(K_f):
                if not fullscreen:
                    self.fullScreen(True)
                    fullscreen = True
                else:
                    self.fullScreen(False)
                    fullscreen = False
            elif self.keyPressed(K_SPACE):
                # load and place the images
                self.placeImages() # this is only for testing


def main():
    grid = SquareMap()
    grid.run()
    sys.exit()


#this calls the 'main' function when this script is executed
if __name__ == '__main__': main()

