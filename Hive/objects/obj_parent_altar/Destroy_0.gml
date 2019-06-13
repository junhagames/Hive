if (global.isBossClear) {
	instance_create_layer(room_width / 2, room_height / 2, "layer_above", obj_stuff_heli);
}
else {
	instance_create_layer(x, y, "layer_inst", spawnTo);
	
	with (obj_parent_entry) {
		var block = instance_create_layer(x, y, "layer_solid", obj_solid_block);
		block.image_xscale = sprite_width / block.sprite_width;
		block.image_yscale = sprite_height / block.sprite_height;
		blockID = block.id;
	}
}
scr_room_inst_save(index);

event_inherited();