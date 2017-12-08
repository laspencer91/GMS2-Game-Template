/// @description Try Some Variable Saving

visitedRooms = ds_map_create();
ds_map_add(visitedRooms, "Level2", false);
ds_map_add(visitedRooms, "Level3", false);

gss_AddInstance(id, LOCAL);
gss_AddVariable("x");
gss_AddLocalVar("visitedRooms", ds_type_map);
