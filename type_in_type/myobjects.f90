module myobjects
  implicit none
  
  private
  public :: mytype, myothertype
  
  integer, private, parameter :: real_kind =  kind(1.d0)
  integer, private, parameter :: err_len =  1024
  
  type mytype
    real(real_kind), allocatable :: arr(:)
  contains
    procedure :: sumarr
    procedure :: printarr
  end type
  
  type myothertype
    type(mytype) :: my
    integer :: c = 0
  contains
    procedure :: add2arr
  end type
  
contains
  
  subroutine add2arr(self)
    class(myothertype), intent(inout) :: self
    self%my%arr = self%my%arr + self%c
  end subroutine
  
  subroutine printarr(self, err)
    class(mytype), intent(in) :: self
    character(len=err_len), intent(out) :: err
    err = ""
    if (.not.allocated(self%arr)) then
      err = 'arr not allocated'
      return
    end if
    print*,self%arr
  end subroutine
  
  subroutine sumarr(self, result, err)
    class(mytype), intent(in) :: self
    real(real_kind), intent(out) :: result
    character(len=err_len), intent(out) :: err
    err = ""
    if (.not.allocated(self%arr)) then
      err = 'arr not allocated'
      return
    endif    
    result = sum(self%arr)
  end subroutine
    
end module