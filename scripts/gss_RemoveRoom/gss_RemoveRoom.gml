/// @description gss_RemoveRoom Removes room data from the internal save data structure
///              to save these changes to the disk you need to use gss_SecureSave()
/// @function gss_RemoveRoom(room)
/// @param room the room id to remove
/// @example gss_RemoveRoom(room1)

var _roomToRemove = argument0;
var _roomToRemoveName = room_get_name(_roomToRemove);

ds_map_destroy(global.gameRooms[? _roomToRemoveName]);
ds_map_delete(global.gameRooms, _roomToRemoveName);

show_message(_roomToRemoveName + " has been removed");
