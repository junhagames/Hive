newRoomSuf = surface_create(global.gameWidth * global.resolution, global.gameHeight * global.resolution);
oldRoomSuf = surface_create(global.gameWidth * global.resolution, global.gameHeight * global.resolution);
surface_set_target(newRoomSuf);
draw_clear_alpha(c_white, 0);
surface_set_target(oldRoomSuf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
surface_reset_target();

surface_copy(oldRoomSuf, 0, 0, application_surface);

if (global.previousPos == POS.TOP || global.previousPos == POS.TOP_LEFT || global.previousPos == POS.TOP_RIGHT) {
	xTo = 0;
	yTo = global.gameHeight * global.zoom;
}
else if (global.previousPos == POS.RIGHT || global.previousPos == POS.RIGHT_TOP || global.previousPos == POS.RIGHT_BOTTOM) {
	xTo = -global.gameWidth * global.zoom;
	yTo = 0;
}
else if (global.previousPos == POS.BOTTOM || global.previousPos == POS.BOTTOM_RIGHT || global.previousPos == POS.BOTTOM_LEFT) {
	xTo = 0;
	yTo = -global.gameHeight * global.zoom;
}
else if (global.previousPos == POS.LEFT || global.previousPos == POS.LEFT_BOTTOM || global.previousPos == POS.LEFT_TOP) {
	xTo = global.gameWidth * global.zoom;
	yTo = 0;
}