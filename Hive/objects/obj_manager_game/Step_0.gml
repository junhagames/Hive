if (keyboard_check(vk_escape)) {
	instance_create_layer(0, 0, "layer_system", obj_pause);
}

// 디버그
if (keyboard_check_pressed(vk_f1)) {
	global.zoom = 1;
}
if (keyboard_check_pressed(vk_f2)) {
	global.zoom = 0.75;
}
if (keyboard_check_pressed(vk_f3)) {
	global.resolution = 1;
}
if (keyboard_check_pressed(vk_f4)) {
	global.resolution = 0.2;
}

if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}

if (keyboard_check_pressed(vk_f12)) {
	if window_get_fullscreen() {
		window_set_fullscreen(false);
	}
	else {
		window_set_fullscreen(true);
	}
}