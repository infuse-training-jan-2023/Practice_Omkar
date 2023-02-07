import numpy as np
import sys
import os

print("Author: ", os.getenv("name"))
arg = sys.argv[1]
arr = np.array(arg)
print("Arr = ", arr)
