scr_init();

scr_world_reset(20);
scr_world_room_goto(global.currentIndex);

show_debug_overlay(true);

// TODO save & load
//var saveMap = ds_map_create();
//ds_map_add_list(saveMap, "worldList", global.worldList);
//var str = json_encode(saveMap);
//var file = file_text_open_write("save.json");
//file_text_write_string(file, str);
//file_text_close(file);