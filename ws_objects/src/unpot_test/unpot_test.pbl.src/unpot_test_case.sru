$PBExportHeader$unpot_test_case.sru
$PBExportComments$Base class for tests in unpot framework.
forward
global type unpot_test_case from nonvisualobject
end type
end forward

global type unpot_test_case from nonvisualobject
end type
global unpot_test_case unpot_test_case

type variables

end variables

forward prototypes
public subroutine setup ()
public subroutine teardown ()

end prototypes

public subroutine setup ();
// Virtual method: override in descendants
end subroutine

public subroutine teardown ();
// Virtual method: override in descendants
end subroutine

on unpot_test_case.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_case.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

