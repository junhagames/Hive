draw_set_halign(fa_left);
draw_text(100, 100, title);

draw_set_valign(fa_top);
draw_text(100, 200, string_hash_to_newline(string_copy(text, 1, textPos)));
draw_set_valign(fa_middle);

draw_set_alpha(abs(sin(continueAlpha / room_speed / 0.5)));
draw_set_halign(fa_right);
draw_text(global.gameWidth - 60, global.gameHeight - 60, "계속하려면 아무키나 누르세요");
draw_set_alpha(1);
draw_set_halign(fa_center);

scr_draw_circlebar(120, room_height - 80, skipPos, skipPosMax, 30, c_white, skipAlpha, 30);