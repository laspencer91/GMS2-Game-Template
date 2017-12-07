/// @description Add a variable to keep saved for a Singleton object
///              This should be called from a Singleton objects create event.
/// @function gss_AddSingletonVar(var)
/// @param string variable to keep saved

var _varToAdd = argument[0];

var _objectName_ = object_get_name(id.object_index);


if (!ds_map_exists(global.dataObjects, _objectName_))
{
	show_debug_message("The object " + _objectName_ + " tryed to add a variable to the Save System before adding itself.");
	return;
}

var _instanceVariableMap_ = global.dataObjects[? _objectName_];

if (argument_count > 1)
{
	if (argument[1] == ds_type_map)	
	{
		ds_map_add_map(_instanceVariableMap_, DS_T_MAP + _varToAdd, variable_instance_get(id, _varToAdd)) 
	}
}
else
	ds_map_add(_instanceVariableMap_, _varToAdd, variable_instance_get(id, _varToAdd));
