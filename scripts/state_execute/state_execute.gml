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
else
{
	// Add state to the history stack
	var _machineStack = stateMachines[| _machineToRunIndex_ + STATE_STACK_OFFSET];
	ds_list_add(_machineStack, _currState);

	// Remove oldest state if the amount of states in the history is greater than max state count
	if (ds_list_size(_machineStack) > MAX_STATE_HISTORY_COUNT)
		ds_list_delete(_machineStack, 0);
}

_stateChangedThisStep_ = false;
