/// @description Save the game data to disk
/// @function gss_SaveSecure(fname)
/// @param string filename

gss_SaveRoomData();
gss_SaveSingletons();
ds_map_secure_save(global.saveDataMap, argument0);
gss_Debug();