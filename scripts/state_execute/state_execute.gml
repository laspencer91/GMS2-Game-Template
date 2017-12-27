/// @desc Run State Machine
/// @param machine index of machine to run step on
/// @example state_execute(moveMachine);

_machineToRunIndex_  = argument0;

var _machineToRun    = stateMachines[| _machineToRunIndex_];
var _currState       = stateMachines[| _machineToRunIndex_ + CURR_STATE_OFFSET]; // index + 1 is index for current state
var _scriptToExecute = _machineToRun[? _currState];

script_execute(_scriptToExecute);

// Dont reset the on enter if it was changed within the script_execute
if (!_stateChangedThisStep_)
{
	// index + 2 is the index for on enter.. set it to false
	stateMachines[| _machineToRunIndex_ + ON_ENTER_OFFSET] = false;
}

_stateChangedThisStep_ = false;
