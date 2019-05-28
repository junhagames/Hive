// 피격 효과 그리기
if (damageAlpha > 0) {
	draw_set_alpha(damageAlpha);
	draw_set_color(c_red);
	draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}

// 광원 그리기
if (surface_exists(lightSuf)) {
	draw_surface(lightSuf, 0, 0);
}

draw_set_alpha(0.6);
// 체력 그리기
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_lime);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_set_color(c_black);
	draw_rectangle(40, 40, 340, 80, true);
	draw_set_color(c_white);
}

// 코인 그리기
draw_sprite(spr_ui_coin, 0, 40, 120);
draw_text(60, 120, global.chrMap[? "coin"]);

// 미니맵 그리기
if (surface_exists(minimapSuf)) {
	if (keyboard_check(vk_tab)) {
		draw_set_color(c_black);
		draw_rectangle(global.gameWidth / 2 - surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 - surface_get_height(minimapSuf) / 2,
			global.gameWidth / 2 + surface_get_width(minimapSuf) / 2,
			global.gameHeight / 2 + surface_get_height(minimapSuf) / 2,
			false);
		draw_set_color(c_white);
		draw_surface(minimapSuf, global.gameWidth / 2 - surface_get_width(minimapSuf) / 2, global.gameHeight / 2 - surface_get_height(minimapSuf) / 2);
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

if (os_type == os_windows) {
	// 총알 그리기
	if (global.chrMap[? "swap"] == "ranger") {
		if (global.chrMap[? "ammo"] >= max(global.chrMap[? "ammoMax"] / 3, 1)) {
			draw_set_color(c_white);
		}
		else if (global.chrMap[? "ammo"] > 0) {
			draw_set_color(c_yellow);
		}
		else {
			draw_set_color(c_red);
		}
		draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) + 25, global.chrMap[? "ammo"]);
		draw_set_color(c_white);
	}
}
else if (os_type == os_android) {
	// 가상 조이스틱 그리기
	scr_vstick_draw(VSTICK.MOVE);
	scr_vstick_draw(VSTICK.ATTACK);
}