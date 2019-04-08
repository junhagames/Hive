if (hiveMap[? "hp"] < hiveMap[? "hpMax"]) {
	draw_set_color(c_fuchsia);
	draw_rectangle(x - 32, y - sprite_height - 20, x - 32 + hiveMap[? "hp"] / hiveMap[? "hpMax"] * 64, y - sprite_height - 5, false);
	draw_set_color(c_white);
	draw_rectangle(x - 32, y - sprite_height - 20, x + 32, y - sprite_height - 5, true);
}