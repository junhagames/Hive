if (global.isBossClear) {
	instance_create_layer(room_width / 2, room_height / 2, "layer_above", obj_stuff_heli);
}
else {
	var dir = point_direction(obj_chr.x, obj_chr.y, x, y);
	instance_create_layer(x + lengthdir_x(300, dir), y + lengthdir_y(300, dir), "layer_inst", spawnTo);
	
	with (obj_parent_entry) {
		var wall = instance_create_layer(x, y, "layer_solid", obj_solid_wall);
		wall.image_xscale = sprite_width / wall.sprite_width;
		wall.image_yscale = sprite_height / wall.sprite_height;
		wallID = wall.id;
	}
}
scr_room_inst_save(index);

event_inherited();