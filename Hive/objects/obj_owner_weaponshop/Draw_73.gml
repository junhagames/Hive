var _x = x - string_width("보유 코인 " + string(global.chrMap[? "coin"])) / 2;
draw_set_halign(fa_left);
draw_set_color(c_aqua);
draw_text(_x, y, "보유 코인 ");
draw_set_color(c_yellow);
draw_text(_x + string_width("보유 코인 "), y, string(global.chrMap[? "coin"]));
draw_set_color(c_white);
draw_set_halign(fa_center);