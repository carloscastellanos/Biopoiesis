from Tkinter import *
import sys, math

def rgb2Hex(rgb_tuple):
    return '#%02x%02x%02x' % tuple(rgb_tuple)

def drawHex(cc):
	"""draws a hexagon."""
	
	hexhalfheight = math.sin(math.radians(60))
	    
	can = Canvas(root, width=sw, height=sh)
	can.pack()
	
	for coordandcolor in cc:
	
		xoffset = coordandcolor[0]
		yoffset = coordandcolor[1]
		width = coordandcolor[2]

		#create points
		sidelength = width/2
		xmotion = sidelength/2
		ymotion = sidelength*hexhalfheight
		
		sides = []
		sides.append([0+xoffset, ymotion+yoffset])
		sides.append([xmotion+xoffset, 2*ymotion+yoffset])
		sides.append([xmotion + sidelength+xoffset, 2*ymotion+yoffset])
		sides.append([sidelength*2+xoffset, ymotion+yoffset])
		sides.append([xmotion + sidelength+xoffset, 0+yoffset])
		sides.append([xmotion+xoffset, 0+yoffset])
		
		can.create_polygon(sides[0][0],sides[0][1],sides[1][0],sides[1][1],sides[2][0],sides[2][1],
                                   sides[3][0],sides[3][1],sides[4][0],sides[4][1],sides[5][0],sides[5][1],
                                   fill=rgb2Hex(coordandcolor[3]))
	
	return

     
root = Tk()

sw = root.winfo_screenwidth()
sh = root.winfo_screenheight()

# set to full screen
root.geometry("%dx%d+0+0" % (sw, sh))

#remove title bar
#this works for Mac
if sys.platform.startswith("darwin") or sys.platform.startswith("mac"):
	root.call("::tk::unsupported::MacWindowStyle", "style", root._w,
"help", "none")
else:
	#this works of all other OSes
	root.overrideredirect(True)

root.focus_set() # <-- move focus to this widget
root.bind("<Escape>", lambda e: e.widget.quit())


coordsandcolors = ( (550,550,100,(151,151,151)),(474,504,100,(51,51,51)), (11,20,100,(204,204,204)) )
drawHex(coordsandcolors)

root.mainloop()
