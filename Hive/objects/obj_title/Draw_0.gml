draw_sprite(spr_logo, 0, 280, 300);

draw_set_halign(fa_left);
draw_text(30, room_height - 30, platform + VERSION);
draw_set_halign(fa_center);

draw_text(room_width - room_width / 4, 60, "캐릭터 선택");