/// @desc Pops the previous state off the stack and returns it. This can be used
///       in order to find what the previous state was, it also removes it from the
///       stack. If you want to get a specific value in the stack without removing it
///       use state_get_history to return the entire list of history.
///       NOTE: This is not actually a stack data structure. It is a list with some stack
///             functions, but can be used like a list.
/// @param machineIndex(optional) index of state machine to pop previous state from.
/// @returns The newest state added to the list or -1 if the list is empty

if (argument_count > 0)
	_machineIndex = argument[0];
else
	_machineIndex = _machineToRunIndex_;

var _thisMachinesHistory = stateMachines[| _machineIndex + STATE_STACK_OFFSET];
var _indexOfLastElement  = ds_list_size(_thisMachinesHistory) - 1;

// Return -1 if the list was empty
if (_indexOfLastElement < 0)
	return -1;

// Get value of previous state
var _previousState = _thisMachinesHistory[| _indexOfLastElement];

// Remove the previous state from the list
ds_list_delete(_thisMachinesHistory, _indexOfLastElement);

return _previousState; // Return previous state