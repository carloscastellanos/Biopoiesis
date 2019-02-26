from Tkinter import *
import sys
     
root = Tk()

sw = root.winfo_screenwidth()
sh = root.winfo_screenheight()

# test
print "screen width =", sw
print "screen height =", sh

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

root.mainloop()