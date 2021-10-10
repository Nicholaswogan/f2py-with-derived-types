module myobjects_alt
  use iso_c_binding
  implicit none
  
  public
  
  type myothertype_alt
    type(c_ptr) :: my
    integer :: c
  end type
  
end module