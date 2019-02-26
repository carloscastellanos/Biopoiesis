import pygame, sys
from pygame.locals import *
 
# Define some colors
black    = (   0,   0,   0)
white    = ( 255, 255, 255)
green    = (   0, 255,   0)
red      = ( 255,   0,   0)


def keyPressed(inputKey):
	keysPressed = pygame.key.get_pressed()
	if keysPressed[inputKey]:
		return True
	else:
		return False


pygame.init()
  
# Set the height and width of the screen
size=[720,450]
screen=pygame.display.set_mode(size)
fullscreen=False
 
pygame.display.set_caption("Biopoiesis SOM")
 
#Loop until the user clicks the close button.
done=False
 
# Used to manage how fast the screen updates
clock=pygame.time.Clock()
 
# -------- Main Program Loop -----------
while done==False:
	for event in pygame.event.get(): # User did something
		if event.type == QUIT: # If user clicked close
			done=True # Flag that we are done so we exit this loop

	if keyPressed(K_ESCAPE):
		done = True
	elif keyPressed(K_f):
		if not fullscreen:
			screen = pygame.display.set_mode(size, pygame.FULLSCREEN)
			fullscreen = True
			pygame.mouse.set_visible(False)
		else:
			screen = pygame.display.set_mode(size)
			fullscreen = False
			pygame.mouse.set_visible(True)
 
    # Set the screen background
	screen.fill(black)
 
    # Limit to 20 frames per second
	clock.tick(20)
 
    # Go ahead and update the screen with what we've drawn.
	pygame.display.flip()
     

pygame.quit()
sys.exit()