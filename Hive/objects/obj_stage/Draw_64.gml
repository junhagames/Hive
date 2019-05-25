#region 광원
if (surface_exists(lightSuf)) {
	draw_surface(lightSuf, 0, 0);
}
else {
	lightSuf = surface_create(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
}
#endregion

draw_set_alpha(0.6);
#region 체력
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_lime);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_set_color(c_black);
	draw_rectangle(40, 40, 340, 80, true);
	draw_set_color(c_white);
}
#endregion
#region 돈
draw_sprite_ext(spr_ui_coin, 0, 40, 120, 1, 1, 0, c_white, draw_get_alpha());
draw_text(60, 120, global.chrMap[? "coin"]);
#endregion
#region 미니맵
if (surface_exists(minimapSuf)) {
	if (keyboard_check(vk_tab)) {
		draw_set_color(c_black);
		draw_rectangle(global.gameWidth / 2 * global.zoom - surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 * global.zoom - surface_get_height(minimapSuf) / 2,
			global.gameWidth / 2 * global.zoom + surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 * global.zoom + surface_get_height(minimapSuf) / 2,
			false);
		draw_set_color(c_white);
		draw_surface(minimapSuf, global.gameWidth / 2 * global.zoom - surface_get_width(minimapSuf) / 2, global.gameHeight / 2 * global.zoom - surface_get_height(minimapSuf) / 2);
	}
	else {
		draw_surface_part(minimapSuf, minimapX, minimapY, 200, 200, global.gameWidth * global.zoom - 240, 40);

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
		draw_sprite_ext(frameSprite, 0, global.gameWidth * global.zoom - 240, 40, 1, 1, 0, c_white, 1);
	}
}
else {
	scr_minimap_create();
}
#endregion
draw_set_alpha(1);

#region 총알
if (global.chrMap[? "swap"] == "ranger") {
	draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) + 25, global.chrMap[? "ammo"]);
}
#endregion

// 가상 조이스틱 그리기
scr_vstick_draw(VSTICK.MOVE);
scr_vstick_draw(VSTICK.ATTACK);