draw_set_alpha(0.6);

// 체력 그리기
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_lime);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_sprite_ext(spr_ui_hpbar, 0, 40, 40, 1, 1, 0, c_white, 1);
	
	if (os_type == os_android) {
		draw_sprite_ext(spr_ui_menu_option, 0, 70, 60, 0.2, 0.2, 0, c_white, 1);
	}
	draw_set_halign(fa_right);
	draw_set_color(c_black);
	draw_text(330, 60, string(global.chrMap[? "hp"]) + "/" + string(global.chrMap[? "hpMax"]));
	draw_set_color(c_white);
	draw_text(332, 62, string(global.chrMap[? "hp"]) + "/" + string(global.chrMap[? "hpMax"]));
	draw_set_halign(fa_center);
}

// 미니맵 그리기
if (surface_exists(minimapSuf)) {
	if ((os_type == os_windows && keyboard_check(vk_tab)) ||
		(os_type == os_android && global.vkey[VKEY.MINIMAP, VKEY_SETTING.CHECK])) {
		draw_set_color(c_dkgray);
		draw_rectangle(global.gameWidth / 2 - surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 - surface_get_height(minimapSuf) / 2,
			global.gameWidth / 2 + surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 + surface_get_height(minimapSuf) / 2,
			false);
		draw_set_color(c_white);
		draw_surface_ext(minimapSuf, global.gameWidth / 2 - surface_get_width(minimapSuf) / 2 * 1.5, global.gameHeight / 2 - surface_get_height(minimapSuf) / 2 * 1.5, 1.5, 1.5, 0, c_white, draw_get_alpha());
	}
	else {
		draw_surface_part(minimapSuf, minimapX, minimapY, 200, 200, global.gameWidth - 240, 40);
		draw_sprite(spr_ui_minimap_frame, 0, global.gameWidth - 240, 40);
	}
}
else {
	scr_minimap_create();
}
draw_set_alpha(1);