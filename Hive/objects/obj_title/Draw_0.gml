draw_sprite(spr_text_logo, 0, 320, 300);

draw_set_halign(fa_left);
draw_text(30, room_height - 60, "[개발진] 강준하, 김유빈, 구연진, 안민혁");
draw_text(30, room_height - 30, platform + VERSION + " BETA");
draw_set_halign(fa_center);

draw_sprite(spr_text_chrselect, 0, room_width - room_width / 4, 120);