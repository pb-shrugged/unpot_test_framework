$PBExportHeader$unpot_test_assert.sru
forward
global type unpot_test_assert from nonvisualobject
end type
end forward

global type unpot_test_assert from nonvisualobject
end type
global unpot_test_assert unpot_test_assert

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
unpot_test_rterror_assert_fail rterror

rterror = create unpot_test_rterror_assert_fail

rterror.number = gn_unpot_test_application.SIGNAL_ERROR_ASSERT_FAIL
rterror.setMessage(message_error + ' | ' + message_expected )

throw rterror
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

on unpot_test_assert.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_assert.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

