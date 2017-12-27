/// @desc Create New State Machine and returns the Machines Index
///       The two indexes after the machines index is this machines current state and on enter boolean.
///       EX: Index 0: State Machine Map	Index 1: Current State    Index 2: On Enter

// Macros used to identify the index offsets of the current state and on enter properties
#macro CURR_STATE_OFFSET 1
#macro ON_ENTER_OFFSET 2

// Lazy Initialization of stateMachines data structure
if (!variable_instance_exists(id, "stateMachines"))
	stateMachines = ds_list_create();
	
var _newMachineIndex = ds_list_size(stateMachines);

ds_list_add(stateMachines, ds_map_create());        // New State Map Reference
ds_list_add(stateMachines, noone);					// Current State
ds_list_add(stateMachines, true);					// On State Enter ?

_stateChangedThisStep_ = false;

return _newMachineIndex;
