/// @description Loads a previously securely saved map into our
///              persistance data structure.
/// @function gss_LoadGame(fileName)
/// @param {string} fileName of previously saved file on the disk as saved by gss_SaveSecure

global.saveDataMap = ds_map_secure_load(slotFileName);
global.gameRooms   = global.saveDataMap[? "gameRooms"];		
global.dataObjects = global.saveDataMap[? "dataObjects"];