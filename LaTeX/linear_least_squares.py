import numpy as np
import matplotlib.pyplot as plt

# Simple example of linear least squares fit

# True parameter values
aa = -2.5
bb = 25

# Synthetic data
N = 101
x = np.linspace(0, 10, N)
# change cc to control amplitude of noise
cc = 5
y = aa*x + bb + cc * np.random.rand(N)

# Construct fit
xbar = sum(x)/N
ybar = sum(y)/N
xxbar = sum(x*x)/N
xybar = sum(x*y)/N
a = (xybar - xbar*ybar)/(xxbar - xbar*xbar)
b = (xxbar*ybar - xbar*xybar)/(xxbar - xbar*xbar)

# Plot fit and original data
yhat = a*x + b
plt.plot(x,y,'o')
plt.plot(x,yhat,'b')
plt.title('Linear least squares fit')
plt.xlabel('x')
plt.ylabel('y')
plt.show()
