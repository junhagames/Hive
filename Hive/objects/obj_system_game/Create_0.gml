scr_init();

scr_world_reset(30);
scr_world_room_goto(global.currentIndex);

show_debug_overlay(true);

scr_save_game("save.sav");