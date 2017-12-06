///@desc Initialize Data Stucture For Save Infomation

// Macros used by save system
#macro INST_PROP_DELIMITER ";"
#macro LOCAL 0
#macro SINGLETON 1

// This is the parent of this data structure, it contains nested maps and list that organize data into easily
// accessable elements.
global.saveDataMap = ds_map_create()

// Data Objects are persistent objects or objects that there will never
// be more than one of, and when room doesn't matter to the object. For instance
// when using a manager or Singleton.
global.dataObjects = ds_map_create();

// Game Rooms is a map of rooms that contain saved data.
global.gameRooms   = ds_map_create();

// Add the second level elements to our parent.
// TODO: Add these dynamically, so users can specifiy "types" of data to use
ds_map_replace_map(global.saveDataMap, "dataObjects", global.dataObjects);
ds_map_replace_map(global.saveDataMap, "gameRooms", global.gameRooms);