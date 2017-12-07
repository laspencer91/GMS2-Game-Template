/// @description Load Our File

global.saveDataMap = ds_map_secure_load(slotFileName);
global.gameRooms   = global.saveDataMap[? "gameRooms"];
global.dataObjects = global.saveDataMap[? "dataObjects"];

with (SaveFileSelectionWatcher)
{
	event_user(0);	
}