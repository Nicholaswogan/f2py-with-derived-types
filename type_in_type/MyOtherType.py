from _mytype_wrapper import myothertype_wrapper as wrapper
from MyType import MyType
from FortranWrapperSettings import FortranWrapperSettings

class MyOtherType():
    
    ####################################
    ### create and destroying mytype ###
    ####################################
    
    def __init__(self):
        my = MyType()
        self.my = my
        self._ptr = wrapper.allocate_myothertype(my._ptr)
    
    def __del__(self):
        wrapper.destroy_myothertype(self._ptr)
