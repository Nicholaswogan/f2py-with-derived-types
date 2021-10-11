from _myobjects_wrapper import myothertype_wrapper as wrapper
from MyType import MyType
from FortranWrapperSettings import FortranWrapperSettings

class MyOtherType():
    
    ##########################
    ### create and destroy ###
    ##########################
    
    def __init__(self):
        self._ptr, my_ptr = wrapper.allocate_myothertype()
        self.my = MyType(my_ptr)
    
    def __del__(self):
        wrapper.destroy_myothertype(self._ptr)
        
    ###########################
    ### getters and setters ###
    ###########################
    
    @property
    def c(self):
        return wrapper.get_c(self._ptr)
    
    @c.setter
    def c(self, new_c):
        wrapper.set_c(self._ptr, new_c)
        
    #############################
    ### wrappers for routines ###
    #############################
    
    def add2arr(self):
        wrapper.add2arr(self._ptr)