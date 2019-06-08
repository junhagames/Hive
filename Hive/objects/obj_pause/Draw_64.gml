draw_sprite(spr_pause, 0, 0, 0);

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
draw_set_color(c_white);
draw_set_alpha(1);

draw_text(global.gameWidth / 2, global.gameHeight / 2, "일시정지");