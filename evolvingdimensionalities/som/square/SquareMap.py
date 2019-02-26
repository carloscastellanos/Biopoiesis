import pygame, sys, os
from pygame.locals import *

# 16x10 aspect ratio
GRID_SIZE = (48, 30) # can hold 1440 images
GRID_SQUARE_SIZE = (40, 40) # image should be this size

class SquareMapGrid(object):

    def __init__(self, bg=(0,0,0)):
        self.bgcolor = bg


    def keyPressed(self, inputKey):
	keysPressed = pygame.key.get_pressed()
	if keysPressed[inputKey]:
	    return True
	else:
            return False       

    def setupGrid(self):
        self.gridimg = pygame.Surface((self.size[0],self.size[1]),1)
        self.gridimg = self.gridimg.convert()
        # same bg color as the screen bg
        self.gridimg.fill (self.bgcolor)

        # draw the grid lines

        # make them light gray
        glcolor = (204,0,0)

        # vertical lines...
        pygame.draw.line (self.gridimg, glcolor, (100,0), (100,300), 1)
        pygame.draw.line (self.gridimg, glcolor, (200,0), (200,300), 1)

        # horizontal lines...
        pygame.draw.line (self.gridimg, glcolor, (0,100), (300,100), 1)
        pygame.draw.line (self.gridimg, glcolor, (0,200), (300,200), 1)

        return self.gridimg


    def placeImages(self, images=None):

        """
        Place the images
        """

        # place images to assigned coordinates or generate random ones
        if images == None:
            #assign random images
            myimages = [["" for col in range(GRID_SIZE[1])] for row in range(GRID_SIZE[0])]
            for imgX in range(len(myimages)):
                for imgY in range(len(myimages[imgX])):
                    myimages[imgX][imgY] = "img.jpg"
        else:
            # these come from a data structure representing the SOM's values
            myimages = images


        for x in range(len(myimages)):
            for y in range(len(myimages[x])):
                # get the image
                img = pygame.image.load(os.path.join('', myimages[x][y]))

                # Get the top left location of the img.
                pixelX,pixelY = self.gridMapToPixel(x,y)
                
                # Blit the image to the screen
                self.screen.blit(img, (pixelX,pixelY))


    def gridMapToPixel(self, mapX, mapY):
        return (mapX * GRID_SQUARE_SIZE[0], mapY* GRID_SQUARE_SIZE[1])


    def init(self):
        """
        Setup the screen etc.
        """
        w = GRID_SIZE[0] * GRID_SQUARE_SIZE[0]
        h = GRID_SIZE[1] * GRID_SQUARE_SIZE[1]
        self.size=(w,h)
        self.screen = pygame.display.set_mode(self.size)
        pygame.display.set_caption('Biopoiesis SOM Image Grid')
        self.screen.fill(self.bgcolor) # Set the screen background

        # font
        default_font = pygame.font.get_default_font()
        font = pygame.font.SysFont(default_font, 22)
    
        # set up the Surface to hold the images
        self.mapimg = pygame.Surface((self.size[0],self.size[1]),1)
        self.mapimg = self.mapimg.convert()
        self.mapimg.fill(self.bgcolor)

        #setup the grid
        #self.setupGrid()
        
    
    def run(self):
        pygame.init()
        self.init()

        # Used to manage how fast the screen updates
        clock = pygame.time.Clock()
        
        running = True
        fullscreen = False

        while running == True:

            # Limit to 15 frames per second
            clock.tick(15)

            for event in pygame.event.get():
                if event.type == QUIT:
                    running = False

            if self.keyPressed(K_ESCAPE):
		running = False
	    # toggle fullscreen and cursor on/off
            elif self.keyPressed(K_f):
		if not fullscreen:
		    self.screen = pygame.display.set_mode(self.size, pygame.FULLSCREEN)
		    fullscreen = True
		    pygame.mouse.set_visible(False)
		else:
                    self.screen = pygame.display.set_mode(self.size)
                    fullscreen = False
		    pygame.mouse.set_visible(True)

            # load and place the images
            self.placeImages()

            # update the display
            pygame.display.flip()


def main():
    grid = SquareMapGrid()
    grid.run()
    sys.exit()


#this calls the 'main' function when this script is executed
if __name__ == '__main__': main()


#TODO
#callback function for getting info from SOM (for each learning iteration)
#threading?
