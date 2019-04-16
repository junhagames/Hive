newRoomSuf = surface_create(global.gameWidth, global.gameHeight);
oldRoomSuf = surface_create(global.gameWidth, global.gameHeight);
surface_copy(oldRoomSuf, 0, 0, application_surface);

if (global.previousPos == POS.TOP || global.previousPos == POS.TOP_LEFT || global.previousPos == POS.TOP_RIGHT) {
	xTo = 0;
	yTo = global.gameHeight;
}
else if (global.previousPos == POS.RIGHT || global.previousPos == POS.RIGHT_TOP || global.previousPos == POS.RIGHT_BOTTOM) {
	xTo = -global.gameWidth;
	yTo = 0;
}
else if (global.previousPos == POS.BOTTOM || global.previousPos == POS.BOTTOM_RIGHT || global.previousPos == POS.BOTTOM_LEFT) {
	xTo = 0;
	yTo = -global.gameHeight;
}
else if (global.previousPos == POS.LEFT || global.previousPos == POS.LEFT_BOTTOM || global.previousPos == POS.LEFT_TOP) {
	xTo = global.gameWidth;
	yTo = 0;
}