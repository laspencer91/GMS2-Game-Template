///@ description Update an instances saved variables
/// NOTE THAT THIS IS A LOCAL FUNCTION AND IS ONLY MEANT TO BE CALLED
///      FROM WITHIN THE OTHER SAVESYSTEM SCRIPTS

// Iterates through all the keys that are saved for a specific index and
// updates them with the instances values.
var __instanceVariableMap = argument0;
var __instanceToSave      = argument1;

var __currentVarKey = ds_map_find_first(__instanceVariableMap);

for (__i = 0; __i < ds_map_size(__instanceVariableMap); __i++)
{
		ds_map_replace(__instanceVariableMap, __currentVarKey, variable_instance_get(__instanceToSave, __currentVarKey));
		ds_map_find_next(__instanceVariableMap, __currentVarKey);
}