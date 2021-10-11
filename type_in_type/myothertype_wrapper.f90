module myothertype_wrapper
  use iso_c_binding
  use myobjects, only: myothertype
  implicit none
  
contains
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! allocator and destroyer !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine allocate_myothertype(ptr, my_ptr)
    !f2py integer(8), intent(out) :: ptr
    type(c_ptr), intent(out) :: ptr
    !f2py integer(8), intent(out) :: my_ptr
    type(c_ptr), intent(out) :: my_ptr
    
    type(myothertype), pointer :: myother
    
    allocate(myother)
    ptr = c_loc(myother)
    my_ptr = c_loc(myother)
  end subroutine
  
  subroutine destroy_myothertype(ptr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    type(myothertype), pointer :: myother
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
    
    type(myothertype), pointer :: myother
    call c_f_pointer(ptr, myother)

    myother%c = c
  end subroutine
  
  subroutine get_c(ptr, c)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(out) :: c
    
    type(myothertype), pointer :: myother
    call c_f_pointer(ptr, myother)
    
    c = myother%c
  end subroutine
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! wrappers for subroutines  !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine add2arr(ptr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    
    type(myothertype), pointer :: myother
    call c_f_pointer(ptr, myother)
    
    call myother%add2arr()
  end subroutine

end module