import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np


def main():
    f= open("output.txt", "r")
    l, u = eval(f.readline())
    matrix = [[eval(n) for n in line.strip().split(';')] for line in f.readlines()[1:]]
    image = np.array(matrix)
    plt.imshow(image, extent = (l,u, u,l))
    plt.show()
main()