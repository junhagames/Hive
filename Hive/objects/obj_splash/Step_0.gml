var tweenTime = 2;

if (!isFadeout) {
	if (alpha < 1) {
		alpha += 1 / room_speed / tweenTime;
	}
	else {
		isFadeout = true;
	}
}
else {
	if (alpha < 0 && !instance_exists(obj_transition_fadeout)) {
		scr_transition_fadeout(room_next(room));
	}
	else {
		alpha -= 1 / room_speed / tweenTime;
	}
}