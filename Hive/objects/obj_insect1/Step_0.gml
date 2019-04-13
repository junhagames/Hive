event_inherited()

if (instance_exists(target)) {
	if (distance_to_object(target) < traceDistance) {
		if (alarm[0] == -1) {
			alarm[0] = traceDelay;
		}
	}
}