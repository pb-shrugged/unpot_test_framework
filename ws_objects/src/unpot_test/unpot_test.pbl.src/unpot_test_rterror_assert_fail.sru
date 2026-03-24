$PBExportHeader$unpot_test_rterror_assert_fail.sru
forward
global type unpot_test_rterror_assert_fail from runtimeerror
end type
end forward

global type unpot_test_rterror_assert_fail from runtimeerror
end type
global unpot_test_rterror_assert_fail unpot_test_rterror_assert_fail

on unpot_test_rterror_assert_fail.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unpot_test_rterror_assert_fail.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

