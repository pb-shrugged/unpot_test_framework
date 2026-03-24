$PBExportHeader$utc_framework_self_test.sru
$PBExportComments$Self-tests for the unpot framework.
forward
global type utc_framework_self_test from unpot_test_case
end type
end forward

global type utc_framework_self_test from unpot_test_case
end type
global utc_framework_self_test utc_framework_self_test

type variables
public unpot_test_assert unpot_assert
end variables

forward prototypes
public subroutine setup ()
public subroutine teardown ()
public subroutine test_are_equal_success ()
public subroutine test_are_equal_failure ()
public subroutine test_is_true_success ()
public subroutine test_is_true_failure ()
public subroutine test_is_null_success ()
public subroutine test_is_null_failure ()
end prototypes

public subroutine setup ();
if isNull(unpot_assert) or not isValid(unpot_assert) then
	unpot_assert = create unpot_test_assert
end if
end subroutine

public subroutine teardown ();
if isValid(unpot_assert) then
	destroy unpot_assert
end if
end subroutine

public subroutine test_are_equal_success ();
unpot_assert.are_equal(1, 1, "message_error")
unpot_assert.are_equal("test", "test", "message_error")
unpot_assert.are_equal(true, true, "message_error")
end subroutine

public subroutine test_are_equal_failure ();
boolean lb_caught = false
try
	unpot_assert.are_equal(1, 2, "message_error")
catch (Throwable e)
	lb_caught = true
end try

if not lb_caught then
	unpot_assert.fail("are_equal should have thrown an error for unequal values", "message_error")
end if
end subroutine

public subroutine test_is_true_success ();
unpot_assert.is_true(true, "message_error")
unpot_assert.is_true(1 = 1, "message_error")
end subroutine

public subroutine test_is_true_failure ();
boolean lb_caught = false
try
	unpot_assert.is_true(false, "message_error")
catch (Throwable e)
	lb_caught = true
end try

if not lb_caught then
	unpot_assert.fail("is_true should have thrown an error for false condition", "message_error")
end if
end subroutine

public subroutine test_is_null_success ();
any la_null
setNull(la_null)
unpot_assert.is_null(la_null, "message_error")
end subroutine

public subroutine test_is_null_failure ();
boolean lb_caught = false
try
	unpot_assert.is_null("not null", "message_error")
catch (Throwable e)
	lb_caught = true
end try

if not lb_caught then
	unpot_assert.fail("is_null should have thrown an error for non-null value", "message_error")
end if
end subroutine

on utc_framework_self_test.create
call super::create
end on

on utc_framework_self_test.destroy
call super::destroy
end on

