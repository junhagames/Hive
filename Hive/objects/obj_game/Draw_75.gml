if (os_type == os_windows) {
	// 스킬 쿨타임 그리기
	scr_draw_circlebar(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_chr.alarm[ALARM_CHR.SKILL], global.chrMap[? "skillSpeed"], 20, c_aqua, 1, 4);
	
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
	// 가상 조이스틱|키 그리기
	scr_vstick_draw(VSTICK.MOVE);
	scr_vkey_draw(VKEY.ATTACK);
	//scr_vkey_draw(VKEY.SKILL);
	scr_vkey_draw(VKEY.SWAP);
	scr_vkey_draw(VKEY.DASH);
	
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
		draw_text(global.vkey[VKEY.SWAP, VKEY_SETTING.X], global.vkey[VKEY.SWAP, VKEY_SETTING.Y], global.chrMap[? "ammo"]);
		draw_set_color(c_white);
	}
}