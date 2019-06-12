if (!isSold) {
	if (instance_exists(obj_chr)) {
		if (obj_chr.isAction && obj_chr.stuff == id) {
			draw_text(x, y - sprite_height, string(price) + " " + string(name));
		}
	}
}