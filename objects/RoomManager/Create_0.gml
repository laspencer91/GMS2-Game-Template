/// @description Init RoomManager
///                   
/// This object is persistent and will be created by the GameLoader in the
/// loading room. Since it is persistent its variables will never change unless
/// you tell them too. (On a room change, the variables will not be reset since
/// the create event will only be called once during the game). Also this object
/// will not be destroyed on room changing.

// This object is perfect for keeping track of rooms visited,
// initializing properties of rooms as we progress thought our game,
// and anything else that has to do with rooms!

event_inherited(); // Make sure that this is called in any object that is a child of Singleton

current_room = Level1; // Game Start Room

visitedRooms = ds_map_create();
ds_map_add(visitedRooms, "Level1", true);
ds_map_add(visitedRooms, "Level2", false);
ds_map_add(visitedRooms, "Level3", false);

gss_AddInstance(id);
gss_AddVariable("visitedRooms", ds_type_map);


// Give instances a spawn step.. 4 more for.. like good measure?
alarm[0] = 3;