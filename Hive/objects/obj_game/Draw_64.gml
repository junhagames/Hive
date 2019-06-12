draw_set_alpha(0.6);

// 체력 그리기
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_lime);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_set_color(c_black);
	draw_rectangle(40, 40, 340, 80, true);
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_text(330, 40, string(global.chrMap[? "hp"]) + "/" + string(global.chrMap[? "hpMax"]));
	draw_set_halign(fa_center);
}

// 미니맵 그리기
if (surface_exists(minimapSuf)) {
	if ((os_type == os_windows && keyboard_check(vk_tab)) || (os_type == os_android && global.vkey[VKEY.MINIMAP, VKEY_SETTING.CHECK])) {
		draw_set_color(c_black);
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

		// 미니맵 액자 그리기
		var frameSprite;
		
		switch (global.currentWorld) {
			case "city":
				frameSprite = spr_ui_minimap_city;
				break;
			case "swamp":
				frameSprite = spr_ui_minimap_swamp;
				break;
			case "underground":
				frameSprite = spr_ui_minimap_underground;
				break;
			case "jungle":
				frameSprite = spr_ui_minimap_jungle;
				break;
			case "desert":
				frameSprite = spr_ui_minimap_desert;
				break;
			case "school":
				frameSprite = spr_ui_minimap_school;
				break;
		}
		draw_sprite(frameSprite, 0, global.gameWidth - 240, 40);
	}
}
else {
	scr_minimap_create();
}
draw_set_alpha(1);