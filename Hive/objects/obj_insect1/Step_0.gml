event_inherited()

if (distance_to_object(obj_chr) > followDistance) {
	if (alarm[0] == -1) {
		alarm[0] = followTime;
	}
}
else {
	alarm[0] = 0;
	path_end();
}

if (x > obj_chr.x) {
	image_xscale = -1;
}
else {
	image_xscale = 1;
}