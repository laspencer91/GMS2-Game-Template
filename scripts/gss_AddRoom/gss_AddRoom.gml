///@ desc This script will add a room to the SaveSystem Data Structure
// At this point, a new room is added to the gameRooms map


var _newRoom = argument0;

ds_map_add_map(global.gameRooms, room_get_name(_newRoom), ds_map_create()); // Add a mapping of instances for this room