// Macros used by save system

// Delimiter used for instance keys in the save data map
#macro INST_PROP_DELIMITER ";"

// Used to specify the type of instance to save data for
#macro LOCAL 0
#macro SINGLETON 1

// Tell if the current room is one of the loading rooms
#macro IN_LOADING_ROOM (room == LoadGameLoadingRoom || room == NewGameLoadingRoom)

// Used to identify the type of a data structure saved in the saveData map.
// Prefixes the variable name.			Ex: "0vistitedRooms" : { Nested Map }

#macro VAR_NORMAL -1	// This one will not be placed in a string ever... so we just keep it a real number
#macro DS_T_MAP   "0"
#macro DS_T_LIST  "1"
#macro DS_T_QUEUE "2"