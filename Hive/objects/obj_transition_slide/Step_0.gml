x += xTo / room_speed / 0.3;
y += yTo / room_speed / 0.3;

if (xTo < 0) {
	if (x < xTo) {
		instance_destroy();
	}
}
else {
	if (x > xTo) {
		instance_destroy();
	}
}

if (yTo < 0) {
	if (y < yTo) {
		instance_destroy();
	}
}
else {
	if (y > yTo) {
		instance_destroy();
	}
}

if (surface_exists(newRoomSuf)) {
	surface_copy(newRoomSuf, 0, 0, application_surface);
}