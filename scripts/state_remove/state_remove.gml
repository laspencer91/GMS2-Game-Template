/// @desc Remove a state from the machine
/// @function state_remove(machineIndex, stateIdentifier)
/// @param machineName to remove from
/// @param state to remove
///
/// @example state_remove(machine, "idle");

var _machineIndex = argument0;
var _stateName    = argument1;

var _machineToRemoveFrom = ds_list_find_value(stateMachines, _machineIndex);

ds_map_delete(_machineToRemoveFrom, _stateName);
