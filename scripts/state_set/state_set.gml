/// @desc Set current state of a specific machine without OnEnter
///       This is essentially the same as state_change except when a state
///       is set using this, and the state script calls state_on_enter().. the
///       function will return false instead of true.
/// @param machineIndex index of previously created state machine
/// @param State To Change To

var _machineIndex     = argument0;
var _state            = argument1;

stateMachines[| _machineIndex + CURR_STATE_OFFSET] = _state;
