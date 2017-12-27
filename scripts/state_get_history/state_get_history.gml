/// @desc Return the complete state history. Note this will only contain as many elements as set in the macro
///       MAX_STATE_HISTORY_COUNT
/// @param machineIndex(optional) Get a specific machines history. If this is not set it will use the currently running machine
/// @returns The history of states as a list with the newest state at the highest index in the list
///
/// Note: If trying to get another instances' state history you should use something like..
///			with (Player)
///         {  other.playerStateHistory = state_get_history(myStateMachine); }

var _machineIndex;

if (argument_count > 0)
	_machineIndex = argument[0];
else
	_machineIndex = _machineToRunIndex_;
	
return stateMachines[| _machineIndex + STATE_STACK_OFFSET];