/// @description gss_RemoveRoom Removes room data from the save data structure
/// @function gss_RemoveRoom(room)
/// @param room the room id to remove

var _roomToRemove = argument0;
var _roomToRemoveName = room_get_name(_roomToRemove);

ds_map_destroy(global.gameRooms[? _roomToRemoveName]);
ds_map_delete(global.gameRooms, _roomToRemoveName);

show_message(_roomToRemoveName + " has been removed");
