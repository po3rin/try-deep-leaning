# coding: utf-8
import sys
import os
sys.path.append(os.pardir)  # 親ディレクトリのファイルをインポートするための設定
import numpy as np
from common.functions import softmax, cross_entropy_error, numerical_gradient


class simpleNet:
    def __init__(self):
        self.W = np.random.randn(2, 3)

    def predict(self, x):
        return np.dot(x, self.W)

    def loss(self, x, t):
        z = self.predict(x)
        y = softmax(z)
        loss = cross_entropy_error(y, t)

        return loss


net = simpleNet()

x = np.array([0.6, 0.9])
print(net.W)
print(net.predict(x))
print(np.argmax(x))

t = np.array([0, 0, 1])
print(net.loss(x, t))


def f(w): return net.loss(x, t)


dW = numerical_gradient(f, net.W)

print(dW)
