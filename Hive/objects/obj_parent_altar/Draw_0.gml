draw_self();

draw_set_alpha(0.6);

// 체력 그리기
if (hp > 0) {
	draw_set_color(c_red);
	draw_rectangle(global.gameWidth / 2 - 150, 60, global.gameWidth / 2 - 150 + hp / hpMax * 300, 100, false);
	draw_set_color(c_black);
	draw_rectangle(global.gameWidth / 2 - 150, 60, global.gameWidth / 2 + 150, 100, true);
	draw_set_color(c_white);
}

// 이름 그리기
draw_text(global.gameWidth / 2, 40, name)
draw_set_alpha(1)