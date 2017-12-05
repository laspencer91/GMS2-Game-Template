/// @description Add a variable to keep saved for this instance

var _varToAdd = argument0;

var _whereILive = SaveSystemGetRoomMap();

if (!ds_map_exists(_whereILive, room_get_name(room)))
{
	show_debug_message("The object " + object_get_name(id.object_index) + " tryed to add a variable to the Save System before adding itself.");
	return;
}

ds_map_replace(_whereILive, _varToAdd, variable_instance_get(id, _varToAdd));
