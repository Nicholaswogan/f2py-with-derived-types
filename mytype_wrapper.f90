module mytype_wrapper
  use iso_c_binding
  use myobjects, only: mytype
  implicit none
  
  public

contains
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! allocator and destroyer !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine allocate_mytype(ptr)
    !f2py integer(8), intent(out) :: ptr
    type(c_ptr), intent(out) :: ptr
    type(mytype), pointer :: my
    allocate(my)
    ptr = c_loc(my)
  end subroutine
  
  subroutine destroy_mytype(ptr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    deallocate(my)
  end subroutine
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! getter and setter for arr !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine set_arr(ptr, size_arr, arr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(in) :: size_arr
    real(8), intent(in) :: arr(size_arr)
    
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    
    if (allocated(my%arr)) then
      deallocate(my%arr)
    endif
    allocate(my%arr(size_arr))
    my%arr = arr
  end subroutine
  
  subroutine get_arr_size(ptr, arr_size, alloc)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(out) :: arr_size
    logical, intent(out) :: alloc
    
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    
    if (allocated(my%arr)) then
      arr_size = size(my%arr)
      alloc = .true.
    else
      arr_size = -1
      alloc = .false.
    endif

  end subroutine
  
  subroutine get_arr(ptr, arr_size, arr)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    integer, intent(in) :: arr_size
    real(8), intent(out) :: arr(arr_size)
    
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    
    arr = my%arr
  end subroutine
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! wrappers for subroutines  !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  subroutine printarr(ptr, err)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    character(len=1024), intent(out) :: err
    
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    
    call my%printarr(err)
  end subroutine
  
  subroutine sumarr(ptr, result, err)
    !f2py integer(8), intent(in) :: ptr
    type(c_ptr), intent(in) :: ptr
    real(8), intent(out) :: result
    character(len=1024), intent(out) :: err
    
    type(mytype), pointer :: my
    call c_f_pointer(ptr, my)
    
    call my%sumarr(result, err)
  end subroutine
  
end module