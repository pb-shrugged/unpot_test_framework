$PBExportHeader$unpot_test_expect.sru
forward
global type unpot_test_expect from nonvisualobject
end type
end forward

global type unpot_test_expect from nonvisualobject
end type
global unpot_test_expect unpot_test_expect

forward prototypes
public function boolean are_equal (any expected, any actual, string message_error)
public subroutine fail (string message_expected, string message_error)
public function boolean is_null (any value, string message_error)
public function boolean is_true (boolean condition, string message_error)
end prototypes

public function boolean are_equal (any expected, any actual, string message_error);
boolean lb_result

lb_result = (expected = actual)

if Not lb_result then
	this.fail("Expected: " + string(expected) + ", but was: " + string(actual), message_error)
end if

return lb_result
end function

public subroutine fail (string message_expected, string message_error);
error.number = gn_unpot_test_application.SIGNAL_ERROR_EXPECT_FAIL
error.text = message_error
SignalError(gn_unpot_test_application.SIGNAL_ERROR_EXPECT_FAIL, message_error)
end subroutine

public function boolean is_null (any value, string message_error);
boolean lb_result

lb_result = isNull(value)

if Not lb_result then
	this.fail("Expected null, but was not null", message_error)
end if

return lb_result
end function

public function boolean is_true (boolean condition, string message_error);
boolean lb_result

lb_result = condition

if Not lb_result then
	this.fail("Expected true, but was false", message_error)
end if

return lb_result
end function

on unpot_test_expect.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_expect.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

