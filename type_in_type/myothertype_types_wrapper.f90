module myothertype_type_wrapper
  use iso_c_binding
  implicit none
  
  public
  
  type myothertype_type
    type(c_ptr) :: my
  end type
  
end module