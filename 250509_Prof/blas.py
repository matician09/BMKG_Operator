import numpy as np
import time

# MAT MUL (BLAS Level 3)
A = np.random.rand(1000, 1000)
B = np.random.rand(1000, 1000)

start = time.time()
C = np.dot(A, B)
end = time.time()

print("Matrix multiplication took:", end - start, "seconds")

