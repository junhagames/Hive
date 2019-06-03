// 광원 그리기
if (surface_exists(lightSuf)) {
	draw_surface(lightSuf, 0, 0);
}

// 피격 효과 그리기
if (damageAlpha > 0) {
	draw_set_alpha(damageAlpha);
	draw_set_color(c_red);
	draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}