from MyType import MyType
import numpy as np

my = MyType()

# setting and getting
arr = np.array([1.0,2.0,3.0])
my.arr = arr
assert np.all(my.arr == arr)
print("setters and getters work!")

# functions
my.printarr()
res = my.sumarr()
assert res == np.sum(arr)
print("functions work!")

# test a new instance is actually a new instance
my1 = MyType()

new_arr = np.array([1.0,2.0,3.0,4.0])
my1.arr = new_arr

assert len(my.arr) != len(new_arr)
print("New instances of MyType are actually new instances!")
