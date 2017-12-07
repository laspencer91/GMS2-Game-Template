/// @description Save the game data to disk
/// @function SaveSystemSaveSecure(fname)
/// @param string filename

SaveSystemSaveRoomData();
SaveSystemSaveSingletons();
ds_map_secure_save(global.saveDataMap, argument0);
SaveSystemDebug();