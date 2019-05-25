newRoomSuf = surface_create(global.gameWidth, global.gameHeight);
oldRoomSuf = surface_create(global.gameWidth, global.gameHeight);
surface_set_target(newRoomSuf);
draw_clear_alpha(c_white, 0);
surface_set_target(oldRoomSuf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
surface_reset_target();

if (surface_exists(application_surface)) {
	surface_copy(oldRoomSuf, 0, 0, application_surface);
}

if (global.previousPos == "top" || global.previousPos == "topleft" || global.previousPos == "topright") {
	xTo = 0;
	yTo = global.gameHeight;
}
else if (global.previousPos == "right" || global.previousPos == "righttop" || global.previousPos == "rightbottom") {
	xTo = -global.gameWidth;
	yTo = 0;
}
else if (global.previousPos == "bottom" || global.previousPos == "bottomright" || global.previousPos == "bottomleft") {
	xTo = 0;
	yTo = -global.gameHeight;
}
else if (global.previousPos == "left" || global.previousPos == "leftbottom" || global.previousPos == "lefttop") {
	xTo = global.gameWidth;
	yTo = 0;
}