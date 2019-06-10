if (instance_exists(target)) {
	if (distance_to_object(target) < moveDistance) {
		if (alarm[ALARM_INSECT.MOVE] == -1) {
			alarm[ALARM_INSECT.MOVE] = moveDelay;
		}
	}
}

event_inherited();