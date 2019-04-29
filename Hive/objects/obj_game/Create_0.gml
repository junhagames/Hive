scr_init();

scr_world_reset(20);
scr_world_room_goto(global.currentIndex);

_zoom = 1;
instance_create_layer(0, 0, "layer_system", obj_debugger);