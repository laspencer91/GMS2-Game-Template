/// @description Add a variable to keep saved for a local (specific to a room) instance
/// @function SaveSystemAddLocalVar(var)
/// @param string variable to keep saved

var _varToAdd = argument0;

if (!variable_instance_exists(id, "_whereILive_"))
{
	_whereILive_ = SaveSystemGetRoomMap();
}

var _expectedKey = SaveSystemGenerateInstanceKey(id);

if (!ds_map_exists(_whereILive_, _expectedKey))
{
	show_debug_message("The object " + object_get_name(id.object_index) + " tryed to add a variable to the Save System before adding itself.");
	return;
}

ds_map_replace(_whereILive_[? _expectedKey], _varToAdd, variable_instance_get(id, _varToAdd));
