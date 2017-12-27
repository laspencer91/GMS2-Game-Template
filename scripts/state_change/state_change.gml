/// @desc Change the current state. Specify machine if calling another instances
///       state machine.
/// @param State To Change To
/// @param (optional) Machine name to use
///
/// @example state_change("move");
/// @example state_change(Enemy.moveMachine, "move");

var _machineIndex;

if (argument_count > 1)
{
	_machineIndex = argument[1];
}
else
{
	_machineIndex = _machineToRunIndex_;
}

stateMachines[| _machineIndex + CURR_STATE_OFFSET] = argument[0];
stateMachines[| _machineIndex + ON_ENTER_OFFSET]   = true;
_stateChangedThisStep_ = true;
