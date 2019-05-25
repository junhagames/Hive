if (surface_exists(oldRoomSuf)) {
    draw_surface(oldRoomSuf, x, y);
}

if (surface_exists(newRoomSuf)) {
	draw_surface(newRoomSuf, -xTo + x, -yTo + y)
} 

if (xTo != 0) {
	draw_set_alpha((xTo - x) / xTo / 2);
}
else {
	draw_set_alpha((yTo - y) / yTo / 2);
}
draw_set_color(c_black);
draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
draw_set_color(c_white);
draw_set_alpha(1);