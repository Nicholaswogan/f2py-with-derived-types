
class FortranWrapperSettings():
    def __delattr__(self, key):
        if key == '_ptr':
            raise AttributeError('This attribute cannot be deleted')
        else:
            del self.__dict__[key]
    
    def __setattr__(self, key, value):
        if key == '_ptr' and hasattr(self, '_ptr'):
            raise AttributeError('This attribute can only be set once in the init method')
        else:
            self.__dict__[key] = value