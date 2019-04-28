scr_init();

scr_world_reset(20);
scr_world_room_goto(global.currentIndex);

scr_save_world();

// 디버그
show_debug_overlay(true);

