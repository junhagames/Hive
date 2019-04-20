draw_set_alpha(0.6);
#region Minimap
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
		draw_surface_part(minimapSuf, minimapX, minimapY, 200, 200, 1040, 40);
		draw_set_color(c_black);
		draw_rectangle(1040, 40, 1240, 240, true);
		draw_set_color(c_white);
	}
}
else {
	scr_minimap_create();
}
#endregion
#region HP
if (global.chrMap[? "hp"] > 0) {
	draw_set_color(c_fuchsia);
	draw_rectangle(40, 40, 40 + global.chrMap[? "hp"] / global.chrMap[? "hpMax"] * 300, 80, false);
	draw_set_color(c_white);
	draw_rectangle(40, 40, 340, 80, true);
}
#endregion
#region Money
draw_sprite_ext(spr_ui_money, 0, 40, 120, 1, 1, 0, c_white, draw_get_alpha());
draw_text(60, 120, global.chrMap[? "money"]);
#endregion
draw_set_alpha(1);

#region Ammo
if (global.chrMap[? "swap"] == SWAP.RANGER) {
	draw_set_halign(fa_center);
	draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) + 32, global.chrMap[? "ammo"]);
	draw_set_halign(fa_left);
}
#endregion