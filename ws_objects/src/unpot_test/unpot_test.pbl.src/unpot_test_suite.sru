$PBExportHeader$unpot_test_suite.sru
$PBExportComments$Collection of test cases for unpot framework.
forward
global type unpot_test_suite from nonvisualobject
end type
end forward

global type unpot_test_suite from nonvisualobject
end type
global unpot_test_suite unpot_test_suite

type variables
public unpot_test_case test_cases[]
end variables

forward prototypes
public subroutine setup ()
public subroutine teardown ()
public subroutine add_test_case (unpot_test_case tc)
end prototypes

public subroutine setup ();
// Virtual method: override in descendants
end subroutine

public subroutine teardown ();
// Virtual method: override in descendants
end subroutine

public subroutine add_test_case (unpot_test_case tc);
// Use it on the contructor to add unpot_test_case's to the suite

this.test_cases[UpperBound(this.test_cases) + 1] = tc
end subroutine

on unpot_test_suite.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_suite.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

