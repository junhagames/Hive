// 광원 블랜딩
if (surface_exists(lightSuf)) {
	surface_set_target(lightSuf);
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
	draw_set_color(c_white);
	draw_set_alpha(1);

	if (!instance_exists(obj_transition_slide)) {
		var xscale = global.gameWidth / global.cameraWidth;
		var yscale = global.gameHeight / global.cameraHeight;
		gpu_set_blendmode(bm_subtract);

		with (obj_chr) {
			draw_sprite_ext(spr_vfx_light_glow, 0, scr_x_to_gui(x) + random_range(-3, 3), scr_y_to_gui(y) + random_range(-3, 3), xscale, yscale, 0, c_white, 1);
		}
	
		with (obj_parent_bullet) {
			draw_sprite_ext(sprite_index, 0, scr_x_to_gui(x), scr_y_to_gui(y), xscale, yscale, image_angle, c_white, image_alpha);
		}
		gpu_set_blendmode(bm_normal);
	}
	surface_reset_target();
}
else {
	lightSuf = surface_create(global.gameWidth, global.gameHeight);
}

// 피격 효과 투명도 설정
damageAlpha = scr_tween_to(damageAlpha, 0, 0.06);