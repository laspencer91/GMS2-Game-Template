/// @description Add a variable to keep saved for a local (specific to a room) instance. 
///              USING gss_AddVariable is prefered over this in most cases.
/// @function gss_AddLocalVar(var)
/// @param string variable to keep saved

var _varToAdd = argument[0];

if (!variable_instance_exists(id, "_whereILive_"))
{
	_whereILive_ = gss_GetRoomMap();
}

// Generate an instance key with formate "objectName Start_X StartY" No Space
var _generatedInstanceKey = gss_GenerateInstanceKey(id);

if (!ds_map_exists(_whereILive_, _generatedInstanceKey))
{
	show_debug_message("The object " + object_get_name(id.object_index) + " tryed to add a variable to the Save System before adding itself.");
	return;
}

// Handles Variable Initial Save, and updates after that. Needs to handle the different data types, and that
// is why it is so robust here. The DS_T_MAP is actually a prefix on the variables name "0variableName" tells
// this system that the specific variable needs to be interpreted as a MAP, and treated slightly different
var _instanceVariableMap_ = _whereILive_[? _generatedInstanceKey];

if (argument_count > 1)
{
	switch (argument[1])
	{
		case (ds_type_map):
			ds_map_replace_map(_instanceVariableMap_, DS_T_MAP + _varToAdd, variable_instance_get(id, _varToAdd)) ;
			break;
		case (ds_type_list):
			ds_map_replace_list(_instanceVariableMap_, DS_T_LIST + _varToAdd, variable_instance_get(id, _varToAdd));
			break;
	}
}
else
{
	ds_map_replace(_instanceVariableMap_, _varToAdd, variable_instance_get(id, _varToAdd));
}