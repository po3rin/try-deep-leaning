import numpy as np

a1 = np.array([1010, 1000, 990])
A1 = np.exp(a1) / np.sum(np.exp(a1))
print(A1)

c = np.max(a1)
a2 = a1 - c
A2 = np.exp(a2) / np.sum(np.exp(a2))
print(A2)
