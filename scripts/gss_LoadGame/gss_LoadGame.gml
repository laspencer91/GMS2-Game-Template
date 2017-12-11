/// @description Loads a previously securely saved map into our
///              persistance data structure.
/// @function gss_LoadGame(fileName)
/// @param fileName previously saved file

global.saveDataMap = ds_map_secure_load(slotFileName);
global.gameRooms   = global.saveDataMap[? "gameRooms"];		
global.dataObjects = global.saveDataMap[? "dataObjects"];