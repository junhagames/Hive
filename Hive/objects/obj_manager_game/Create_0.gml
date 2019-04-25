scr_init();

scr_world_reset(20);
scr_world_room_goto(global.currentIndex);

scr_save_game("save.sav");

// DEBUG
show_debug_overlay(true);