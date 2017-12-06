/// @description Load Game

global.saveDataMap = ds_map_secure_load("saveGame.txt")
global.gameRooms   = global.saveDataMap[? "gameRooms"];
global.dataObjects = global.saveDataMap[? "dataObjects"];