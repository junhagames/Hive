draw_sprite_ext(spr_pause, 0, 0, 0, 1, 1, 0, make_color_hsv(current_time / 30 mod 255, 255, 255), 1);
draw_text_transformed(global.gameWidth / 2, global.gameHeight / 2, "PAUSE", 6, 6, 0);