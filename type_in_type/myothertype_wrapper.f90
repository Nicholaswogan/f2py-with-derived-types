module myothertype_wrapper
  use iso_c_binding
  use myobjects_alt, only: myothertype_alt
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
    type(myothertype_alt), pointer :: myother
    
    allocate(myother)
    myother%my = my_ptr
    ptr = c_loc(myother)
  end subroutine
  
  subroutine destroy_myothertype(ptr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    type(myothertype_alt), pointer :: myother
    call c_f_pointer(ptr, myother)
    
    deallocate(myother)
  end subroutine
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! getter and setters !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine set_c(ptr, c)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(in) :: c
    
    type(myothertype_alt), pointer :: myother
    call c_f_pointer(ptr, myother)

    myother%c = c
  end subroutine
  
  subroutine get_c(ptr, c)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(out) :: c
    
    type(myothertype_alt), pointer :: myother
    call c_f_pointer(ptr, myother)
    
    c = myother%c
  end subroutine

end module