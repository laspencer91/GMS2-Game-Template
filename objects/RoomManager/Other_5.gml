/// @description An Option..
///
/// This is a perfect place to maybe save the previous room, or disable some effects.. or decide some
/// logic on where to go from here? Who knows?? But you have it available to you

SaveSystemSaveRoomData();

data = json_encode(global.saveDataMap);

show_message(data);