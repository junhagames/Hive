if (hp < hpMax && hp > 0) {
	draw_set_alpha(0.6);
	draw_set_color(c_red);
	draw_rectangle(x - 32, y - sprite_height - 20, x - 32 + hp / hpMax * 64, y - sprite_height - 5, false);
	draw_set_color(c_black);
	draw_rectangle(x - 32, y - sprite_height - 20, x + 32, y - sprite_height - 5, true);
	draw_set_color(c_white);
	draw_set_alpha(1);
}