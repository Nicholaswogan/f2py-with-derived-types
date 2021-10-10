# f2py-with-derived-types

[`f2py`](https://numpy.org/doc/stable/f2py/) is a tool which provides a connection between the Fortran and Python languages. It is overall and excellent tool. However, it can not easily generate a Python interface for Fortran derived types.

This repository shows that, with some effort, you can wrap a fortran derived type.

`myobjects.f90` contains a derived type `mytype`:

```fortran
type mytype
  real(real_kind), allocatable :: arr(:)
contains
  procedure :: sumarr
  procedure :: printarr
end type
```

`mytype` has an allocatable array, named `arr`, and two type-bound procedures that do things to `arr`. **The goal here is to make a python interface to `mytype`**

The files `mytype_wrapper.f90` and `MyType.py` provide a wrapper to `mytype`. They key to this approach is keeping track of an instance of `mytype` allocated somewhere with a pointer. This pointer is passed between wrapper functions. Take a close look to understand.

To compile, run

```bash
gfortran -c myobjects.f90
f2py -c myobjects.o mytype_wrapper.f90 -c _mytype_wrapper
```

Then you can use the wrapper with code like 

```python
from MyType import MyType
my = MyType()
my.arr = [1,2,3]
print(my.summarr())
```
