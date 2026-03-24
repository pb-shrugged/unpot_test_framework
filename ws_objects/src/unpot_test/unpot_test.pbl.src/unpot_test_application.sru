$PBExportHeader$unpot_test_application.sru
forward
global type unpot_test_application from nonvisualobject
end type
end forward

global type unpot_test_application from nonvisualobject
end type
global unpot_test_application unpot_test_application

type variables
public constant int SIGNAL_ERROR_ASSERT_FAIL = 16001
public constant int SIGNAL_ERROR_EXPECT_FAIL = 16002

public error current_error
end variables

forward prototypes
public subroutine systemerror (error application_error)
public subroutine set_current_error (error application_error)
public subroutine clear_current_error ()
public function error get_current_error ()
end prototypes

public subroutine systemerror (error application_error);
this.set_current_error(application_error)
end subroutine

public subroutine set_current_error (error application_error);
this.current_error = application_error
end subroutine

public subroutine clear_current_error ();
SetNull(this.current_error)
end subroutine

public function error get_current_error ();
return this.current_error
end function

on unpot_test_application.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_application.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

