/// @ desc Return the room map that contains the mapping of instances for the given room
/// @ function gss_GetRoom(room)
/// @ param room (optional) the room to get the map associated with
///         Not specifying a room will use the current room. (Prefered)

var _roomKey;

if (argument_count > 0)
	_roomKey = room_get_name(argument[0]);
else
	_roomKey = room_get_name(room);

if (!ds_map_exists(global.gameRooms, _roomKey))
{
	ds_map_add_map(global.gameRooms, _roomKey, ds_map_create());
}

return global.gameRooms[? _roomKey];