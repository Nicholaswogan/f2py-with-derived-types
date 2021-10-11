from _myobjects_wrapper import mytype_wrapper as wrapper
from FortranWrapperSettings import FortranWrapperSettings

class MyType():
    
    ####################################
    ### create and destroying mytype ###
    ####################################
    
    def __init__(self):
        self._ptr = wrapper.allocate_mytype()
        self.__destroy = True
        
    def __init__(self, ptr):
        self._ptr = ptr
        self.__destroy = False
        
    def __del__(self):
        if self.__destroy:
            wrapper.destroy_mytype(self._ptr)
        
    ###########################
    ### getters and setters ###
    ###########################
    
    @property
    def arr(self):
        arr_size, alloc = wrapper.get_arr_size(self._ptr)
        if alloc:
            return wrapper.get_arr(self._ptr, arr_size)
        else:
            return None
        
    @arr.setter
    def arr(self, new_arr):
        wrapper.set_arr(self._ptr, new_arr)
    
    #############################
    ### wrappers for routines ###
    #############################
    
    def printarr(self):
        err = wrapper.printarr(self._ptr)
        if len(err.strip()) > 0:
            raise Exception(err.decode("utf-8").strip())
        
    def sumarr(self):
        result, err = wrapper.sumarr(self._ptr)
        if len(err.strip()) > 0:
            raise Exception(err.decode("utf-8").strip())
        return result