event_inherited()

if (distance_to_object(obj_chr) < traceDistance) {
	if (alarm[0] == -1) {
		alarm[0] = traceDelay;
	}
}

if (x > obj_chr.x) {
	image_xscale = -1;
}
else {
	image_xscale = 1;
}