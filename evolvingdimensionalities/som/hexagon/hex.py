from Tkinter import *
import sys, math

def rgb2Hex(rgb_tuple):
    return '#%02x%02x%02x' % tuple(rgb_tuple)

def drawHex(x,y,w,rgb):
	"""draws a hexagon."""
	
	xoffset = x
	yoffset = y
	
	hexhalfheight = math.sin(math.radians(60))
	
	width = w

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
	    
	can = Canvas(root, width=sw, height=sh)
	can.pack()
	can.create_polygon(sides[0],sides[1],sides[2],sides[3],sides[4],sides[5], fill=rgb2Hex(rgb))
	
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


drawHex(550,550,100, (102,102,102))

root.mainloop()