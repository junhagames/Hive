if (hp < hpMax) {
	draw_set_color(c_orange);
	draw_rectangle(x - 32, y - sprite_height - 20, x - 32 + hp / hpMax * 64, y - sprite_height - 5, false);
	draw_set_color(c_white);
	draw_rectangle(x - 32, y - sprite_height - 20, x + 32, y - sprite_height - 5, true);
}