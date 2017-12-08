///@ description Update an instances saved variables
/// NOTE THAT THIS IS A LOCAL FUNCTION AND IS ONLY MEANT TO BE CALLED
///      FROM WITHIN THE OTHER SAVESYSTEM SCRIPTS

// Iterates through all the keys that are saved for a specific index and
// updates them with the instances values.
var _instanceVariableMap_  = argument0;
var __instanceToSave       = argument1;
var __instVarKeyList       = ds_map_get_keys(_instanceVariableMap_);
var __currentVarKey;

for (var __i = 0; __i < ds_list_size(__instVarKeyList); __i++)
{
	__currentVarKey = __instVarKeyList[| __i];
		
	if (__currentVarKey == "destroyed")
		return;											  // Dont need to update the instance if its destroyed
	
	var __currentVarType  = gss_GetType(__currentVarKey); // Retrieve a type constant by examining our "variableName" string
	
    // Strip out the "type identifier" in our string if the currentVariable is a dynamic resource (data struct, etc)
	if (__currentVarType != VAR_NORMAL)
		var _varNameNoIdentifier = string_delete(__currentVarKey, 1, 1);
	
	switch (__currentVarType)
	{
		case (real(DS_T_MAP)):
			ds_map_replace_map(_instanceVariableMap_, 
								__currentVarKey, 
								variable_instance_get(__instanceToSave, _varNameNoIdentifier)) ;
			break;
		case (real(DS_T_LIST)):
			ds_map_replace_list(_instanceVariableMap_, 
								__currentVarKey, 
								variable_instance_get(__instanceToSave, _varNameNoIdentifier));
			break;
		default:
			ds_map_replace(_instanceVariableMap_, 
						   __currentVarKey, 
						   variable_instance_get(__instanceToSave, __currentVarKey));
			break;
	}
}