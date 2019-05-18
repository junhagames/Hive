if (hp < 1) {
	if (global.isClear) {
		instance_create_layer(room_width / 2, room_height / 2, "layer_above", obj_stuff_heli);
	}
	else {
		instance_create_layer(x, y, "layer_inst", spawnTo);
	}
	instance_destroy();
}