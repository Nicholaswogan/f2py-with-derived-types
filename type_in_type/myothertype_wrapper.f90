module myothertype_wrapper
  use iso_c_binding
  use myobjects, only: mytype
  use myothertype_type_wrapper, only: myothertype_type
  implicit none
  
  public

contains
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! allocator and destroyer !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine allocate_myothertype(my_ptr, ptr)
    !f2py integer(8), intent(in) :: my_ptr
    type(c_ptr), intent(in) :: my_ptr
    !f2py integer(8), intent(out) :: ptr
    type(c_ptr), intent(out) :: ptr
    type(myothertype_type), pointer :: myother
    
    allocate(myother)
    myother%my = my_ptr
    ptr = c_loc(myother)
  end subroutine
  
  subroutine destroy_myothertype(ptr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    type(myothertype_type), pointer :: myother
    call c_f_pointer(ptr, myother)
    
    deallocate(myother)
  end subroutine
  
  
end module