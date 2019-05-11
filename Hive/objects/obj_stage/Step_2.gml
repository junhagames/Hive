// 광원 블랜딩
if (surface_exists(lightSuf)) {
	surface_set_target(lightSuf);
	draw_set_alpha(0.3);
	draw_set_color(c_dkgray);
	draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
	draw_set_color(c_white);

	if (!instance_exists(obj_parent_transition)) {
		gpu_set_blendmode(bm_subtract);

		with (obj_chr) {
			var _x = (x - obj_camera.x + global.gameWidth / 2) * global.zoom;
			var _y = (y - obj_camera.y + global.gameHeight / 2) * global.zoom;
			draw_circle(_x + random_range(-1, 1), _y + random_range(-1, 1), 180 * global.zoom + random_range(-1, 1), false);
			draw_circle(_x + random_range(-1, 1), _y + random_range(-1, 1), 160 * global.zoom + random_range(-1, 1), false);
		}
	
		with (obj_bullet) {
			var _x = (x - obj_camera.x + global.gameWidth / 2) * global.zoom;
			var _y = (y - obj_camera.y + global.gameHeight / 2) * global.zoom;
			draw_sprite_ext(sprite_index, -1, _x, _y, global.zoom, global.zoom, image_angle, image_blend, image_alpha);
		}
		gpu_set_blendmode(bm_normal);
	}
	draw_set_alpha(1);
	surface_reset_target();
}
else {
	lightSuf = surface_create(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
}