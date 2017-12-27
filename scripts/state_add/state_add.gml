/// @desc Add new state to machine
/// @function state_add
/// @param stateName Name of state to add. Can be real number or string
/// @param stateScript Script to execute during this state. EX: scr_name
///
/// @example state_add(moveMachine, "Idle", scr_idle);

var _machineIndex = argument0;
var _stateName    = argument1;
var _stateScript  = argument2;

var _machineToAddTo = stateMachines[| _machineIndex];
ds_map_add(_machineToAddTo, _stateName, _stateScript);

