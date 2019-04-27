draw_set_alpha(0.6);
#region 체력
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_red);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_set_color(c_black);
	draw_rectangle(40, 40, 340, 80, true);
	draw_set_color(c_white);
}
#endregion
#region 돈
draw_sprite_ext(spr_ui_coin, 0, 40, 120, 1, 1, 0, c_white, draw_get_alpha());
draw_text(60, 120, global.chrMap[? "money"]);
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
		draw_set_color(c_black);
		draw_rectangle(global.gameWidth * global.zoom - 240, 40, global.gameWidth * global.zoom - 40, 240, true);
		draw_set_color(c_white);
	}
}
else {
	scr_minimap_create();
}
#endregion
draw_set_alpha(1);

#region 총알
if (global.chrMap[? "swap"] == SWAP.RANGER) {
	draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) + 25, global.chrMap[? "ammo"]);
}
#endregion