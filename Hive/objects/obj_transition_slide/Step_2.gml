var tweenTime = 0.3;
x += xTo / room_speed / tweenTime;
y += yTo / room_speed / tweenTime;

if ((xTo > 0 && x > xTo) ||
	(xTo < 0 && x < xTo) ||
	(yTo > 0 && y > yTo) ||
	(yTo < 0 && y < yTo)) {
	instance_destroy();
}

if (surface_exists(newRoomSuf)) {
	surface_copy(newRoomSuf, 0, 0, application_surface);
}