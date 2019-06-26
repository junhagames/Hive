if (!isSold) {
	if (instance_exists(obj_chr)) {
		if (obj_chr.stuff == id) {
			var _x = x - string_width(string(price) + " " + string(name)) / 2;
			draw_set_halign(fa_left);
			draw_set_color(c_yellow);
			draw_text(_x, y - sprite_height, string(price));
			draw_set_color(c_white);
			draw_text(_x + string_width(string(price) + " "), y - sprite_height, string(name));
			draw_set_halign(fa_center);
		}
	}
}