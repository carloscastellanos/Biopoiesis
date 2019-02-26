#!/usr/local/bin/ python
#
# Kohonen Self-Organizing Map (SOM)
# Copyright (c) 2009 - Nicolas P. Rougier
#
# Reference:
# ----------
#   Teuvo Kohonen,
#   "Self-organized formation of topologically correct feature maps"
#   Biological Cybernetics, 43:59-69. 1982
import numpy as np
import matplotlib.pyplot as plt


def gaussian(shape=(25,25), center=(0,0), sigma=0.5):
    ''' Return a two-dimensional gaussian with given shape.

    :Parameters:
       `shape` : (int,int)
           Shape of the output array
       `center`: (int,int)
           Center of Gaussian
       `sigma` : float
           Width of Gaussian
    '''
    sigma=float(sigma)
    grid=[]
    for size in shape:
        grid.append (slice(0,size))
    C = np.mgrid[tuple(grid)]
    R = np.zeros(shape)
    for i,size in enumerate(shape):
        R += ((C[i]-center[i])/float(shape[i]))**2
    return np.exp(-R/sigma**2)


class SOM(object):
    ''' Self organizing map class '''

    def __init__(self, shape=(10,10,2)):
        ''' Build map '''

        # Random initialization
        self.codebook = np.random.random(shape)

        # Fixed initialization
        #self.codebook = np.ones(shape)*0.5

        # Regular grid initialization
        #self.codebook = np.zeros(shape)
        #for i in range(shape[0]):
        #    self.codebook[i,:,0] = np.linspace(0,1,shape[1])
        #    self.codebook[:,i,1] = np.linspace(0,1,shape[1])

        self.sigma_t0 = 0.750 # Initial neighborhood parameter
        self.sigma_tf = 0.010 # Final neighborhood parameter
        self.lrate_t0 = 1.000 # Initial learning rate
        self.lrate_tf = 0.005 # Final learning rate


    def learn_data(self, data, lrate, sigma):
        ''' Learn a single datum using lrate and sigma parameter

        :Parameters:
            `lrate` : float
                Learning rate
            `sigma` : float
                Neighborhood parameter
        '''

        # Compute distances to data 
        D = ((self.codebook-data)**2).sum(axis=-1)

        # Get index of nearest node (minimum distance)
        winner = np.unravel_index(np.argmin(D), D.shape)

        # Generate a Gaussian centered on winner
        G = gaussian(D.shape, winner, sigma)
        G = np.nan_to_num(G)

        # Move nodes towards data according to Gaussian 
        delta = (self.codebook - data)
        for i in range(self.codebook.shape[-1]):
            self.codebook[...,i] -= lrate * G* delta[...,i]


    def learn(self, distribution, n=25000):
        ''' Learn given distribution using n data

        :Parameters:
            `distribution` : callable()
                Callable object that return a random point from distribution.
            `n` : int
                Number of data to process
        '''
        data = np.zeros((n,2))
        for i in range(n):            
            # Set sigma and learning rate according to current time
            t = i/float(n)
            lrate = self.lrate_t0 + t*(self.lrate_tf - self.lrate_t0)
            sigma = self.sigma_t0 + t*(self.sigma_tf - self.sigma_t0)

            # Generate a new data
            data[i] = distribution()

            # Learn data
            self.learn_data(data[i],lrate,sigma)

        return data


def square():
    ''' Return a point from a 2 dimensional square uniform distribution. '''
    return np.random.uniform(0,1),np.random.uniform(0,1)


def ring(rmin=0.25,rmax=0.5):
    ''' Return a point from a 2 dimensional ring uniform distribution. '''
    x,y,r = 0,0,-1
    while r<rmin or r>rmax:
        x,y = square()
        r = np.sqrt((x-0.5)**2+(y-0.5)**2)
    return x,y


# -----------------------------------------------------------------------------
if __name__ == '__main__':

    n = 20
    som = SOM((n,n,2))
    data = som.learn(square,n=25000)

    fig = plt.figure(figsize=(8,8))
    axes = fig.add_subplot(1,1,1)
    plt.scatter (data[:,0], data[:,1], s=0.1, color='b', alpha=0.25)
    C = som.codebook
    Cx,Cy = C[...,0], C[...,1]
    for i in range(C.shape[0]):
        plt.plot (Cx[i,:], Cy[i,:], 'b', alpha=.5)
    for i in range(C.shape[1]):
        plt.plot (Cx[:,i], Cy[:,i], 'b', alpha=.5)
    plt.scatter (Cx.flatten(), Cy.flatten(), s=10, color= '.25')
    axes.axis([0,1,0,1])
    axes.set_xticks([])
    axes.set_yticks([])
    axes.set_aspect(1)
    plt.show()
