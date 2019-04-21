if (surface_exists(oldRoomSuf)) {
    draw_surface_ext(oldRoomSuf, x, y, global.zoom / global.resolution, global.zoom / global.resolution, 0, c_white, 1);
}

if (surface_exists(newRoomSuf)) {
	draw_surface_ext(newRoomSuf, -xTo + x, -yTo + y, global.zoom / global.resolution, global.zoom / global.resolution, 0, c_white, 1);
} 

if (xTo != 0) {
	draw_set_alpha((xTo - x) / xTo / 2);
}
else {
	draw_set_alpha((yTo - y) / yTo / 2);
}
draw_set_color(c_black);
draw_rectangle(0, 0, global.gameWidth * global.zoom, global.gameHeight * global.zoom, false);
draw_set_color(c_white);
draw_set_alpha(1);