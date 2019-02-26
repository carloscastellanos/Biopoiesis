from Tkinter import *
import sys, math, Image, ImageDraw, ImageTk

""" Based on code from this site: http://arainyday.se/projects/python/HexagonExample/ """

# This is the rectangular size of the hexagon tiles.
TILE_WIDTH = 38
TILE_HEIGHT = 41

# This is the distance in height between two rows.
ROW_HEIGHT = 31

# This value will be applied to all odd rows x value.
ODD_ROW_X_MOD = 19

# This is the size of the square grid that will help us convert pixel locations to hexagon map locations.
GRID_WIDTH = 38
GRID_HEIGHT = 31

hexhalfheight = math.sin(math.radians(60))


# This is the modification tables for the square grid.

a1=(-1,-1)
b1=(0,0)
c1=(0,-1)

gridEvenRows = [
[a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1,c1,c1],
[a1,a1,a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1,c1,c1],
[a1,a1,a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1,c1,c1],
[a1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,c1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1],
[b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1,b1]
]

a2=(-1,0)
b2=(0,-1)
c2=(0,0)

gridOddRows = [
[a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2],
[a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2],
[a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,b2,b2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,b2,b2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2],
[a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,a2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2]
]


class HexagonMap():

    def __init__(self, c, bgColor):
        #self.img = Image.new("1", (TILE_WIDTH, TILE_HEIGHT), self.rgb2Hex(bgColor))
        self.img = Image.open("hextile.png")
        self.canvas = c


    def uint(self,i):
        i = int(i)
        if i > sys.maxint and i <= 2 * sys.maxint + 1:
            return int((i & sys.maxint) - sys.maxint - 1)
        else:
            return i
        

    def pixelToHexMap(self,x,y):
        """
        Converts a pixel location to a location on the hexagon map.
        """        

        # Get the square location in our help grid.
        gridX = x/GRID_WIDTH
        gridY = y/GRID_HEIGHT
            
        # Calculate the pixel location within that square
        gridPixelX = x%GRID_WIDTH
        gridPixelY = y%GRID_HEIGHT

        # Update the gridRect to show the correct location in the grid
        #self.gridRect.topleft = (gridX*GRID_WIDTH,gridY*GRID_HEIGHT)
       
        # Apply the modifiers to get the correct hexagon map location.
        if gridY&1:
            # Odd rows
            hexMapX=gridX+gridOddRows[gridPixelY][gridPixelX][0]
            hexMapY=gridY+gridOddRows[gridPixelY][gridPixelX][1]
        else:
            # Even rows
            hexMapX=gridX+gridEvenRows[gridPixelY][gridPixelX][0]
            hexMapY=gridY+gridEvenRows[gridPixelY][gridPixelX][1]

        return (hexMapX,hexMapY)

	
    def hexMapToPixel(self,mapX,mapY):
        """
        Returns the top left pixel location of a hexagon map location.
        """
        if mapY & 1:
            # Odd rows will be moved to the right.
            return (mapX*TILE_WIDTH+ODD_ROW_X_MOD,mapY*ROW_HEIGHT)
        else:
            return (mapX*TILE_WIDTH,mapY*ROW_HEIGHT)           
            

    def drawMap(self, color):
	""" Draw the map. """
	print "drawing the map..."
    	
    	# 16x10 aspect ratio
        for x in range(16):
            for y in range(10):
                # Get the top left location of the tile.
                pixelX,pixelY = self.hexMapToPixel(x,y)

		#create points
		sidelength = TILE_WIDTH/2
		xmotion = sidelength/2
		ymotion = sidelength*hexhalfheight
		
		sides = []
		sides.append([0, ymotion])
		sides.append([xmotion, 2*ymotion])
		sides.append([xmotion + sidelength, 2*ymotion])
		sides.append([sidelength*2, ymotion])
		sides.append([xmotion + sidelength, 0])
		sides.append([xmotion, 0])

		allsides = [sides[0][0],sides[0][1],sides[1][0],sides[1][1],sides[2][0],sides[2][1],
                                   sides[3][0],sides[3][1],sides[4][0],sides[4][1],sides[5][0],sides[5][1]]

		imgDraw = ImageDraw.Draw(self.img)
                imgDraw.polygon(allsides, self.rgb2Hex(color))
                del imgDraw
                imgTk = ImageTk.PhotoImage(self.img)
                self.canvas.create_image(pixelX,pixelY, image=imgTk)

        return


    def rgb2Hex(self, rgb_tuple):
        return '#%02x%02x%02x' % tuple(rgb_tuple)


def main():
    """ Setup the screen etc."""
    root = Tk()

    screenW = root.winfo_screenwidth()
    screenH = root.winfo_screenheight()

    # set to full screen
    root.geometry("%dx%d+0+0" % (screenW, screenH))

    #remove title bar
    #this works for Mac
    if sys.platform.startswith("darwin") or sys.platform.startswith("mac"):
        root.call("::tk::unsupported::MacWindowStyle", "style", root._w, "help", "none")
    else:
	#this works of all other OSes
	root.overrideredirect(True)

    root.focus_set() # <-- move focus to this widget
    root.bind("<Escape>", lambda e: e.widget.quit())
    
    # init Tk Canvas
    can = Canvas(root, width=screenW, height=screenH)
    can.pack()
    #bgcolor for hexagon image
    bgcolor = (255,0,255)
    #Init HexagonMap
    hexmap = HexagonMap(can, bgcolor)
    #coordsandcolors = ( (550,550,(151,151,151)), (551,551,(51,51,51)),  (20,80,(51,51,51)) )
    #can.drawMap(coordsandcolors)
    #fill color for hexagon image (this will evetually be diff for each one)
    fillcolor = (151,151,151)
    hexmap.drawMap(fillcolor)
    
    can.mainloop()
	
	

#this calls the 'main' function when this script is executed
if __name__ == '__main__': main()
