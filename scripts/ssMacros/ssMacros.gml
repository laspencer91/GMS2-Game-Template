// Macros used by save system

// Delimiter used for instance keys in the save data map
#macro INST_PROP_DELIMITER ";"

// Used to specify the type of instance to save data for
#macro LOCAL 0
#macro SINGLETON 1

// Tell if the current room is one of the loading rooms
#macro IN_LOADING_ROOM (room == LoadGameLoadingRoom || room == NewGameLoadingRoom)
