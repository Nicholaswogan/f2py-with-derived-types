from _myobjects_wrapper import myothertype_wrapper as wrapper
from MyType import MyType
from FortranWrapperSettings import FortranWrapperSettings

class MyOtherType():
    
    ##########################
    ### create and destroy ###
    ##########################
    
    def __init__(self):
        my = MyType()
        self.my = my
        self._ptr = wrapper.allocate_myothertype(my._ptr)
    
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