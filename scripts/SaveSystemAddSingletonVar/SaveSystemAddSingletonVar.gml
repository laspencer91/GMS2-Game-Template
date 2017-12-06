/// @description Add a variable to keep saved for a Singleton object
///              This should be called from a Singleton objects create event.
/// @function SaveSystemAddSingletonVar(var)
/// @param string variable to keep saved

var _varToAdd = argument0;

var _objectName_ = object_get_name(id.object_index);

if (!ds_map_exists(global.dataObjects, _objectName_))
{
	show_debug_message("The object " + _objectName_ + " tryed to add a variable to the Save System before adding itself.");
	return;
}

var _instanceVariableMap_ = global.dataObjects[? _objectName_];

ds_map_replace(_instanceVariableMap_, _varToAdd, variable_instance_get(id, _varToAdd));
