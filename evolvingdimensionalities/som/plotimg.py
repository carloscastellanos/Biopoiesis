import matplotlib.pyplot as PLT
from matplotlib.offsetbox import AnnotationBbox, OffsetImage
from matplotlib._png import read_png
import matplotlib.image as mpimg

fig = PLT.gcf()
fig.clf()
ax = PLT.subplot(111)

#### add a first image ####
arr_hand = read_png('test.png')
imagebox = OffsetImage(arr_hand, zoom=.1)
xy = [0.25, 0.45]                       # the coordinates to position this image
ab = AnnotationBbox(imagebox, xy,
    xybox=(30., -30.),
    xycoords='data',
    boxcoords="offset points")                                  
ax.add_artist(ab)

#### add a second image ####
arr_vic = read_png('ba.jpg')
imagebox = OffsetImage(arr_vic, zoom=.1)
xy = [.6, .3]                         # the coordinates to position this 2nd image
ab = AnnotationBbox(imagebox, xy,
    xybox=(30, -30),
    xycoords='data',
    boxcoords="offset points")
ax.add_artist(ab)

# rest is just standard matplotlib boilerplate
ax.grid(True)
PLT.draw()
PLT.show()
