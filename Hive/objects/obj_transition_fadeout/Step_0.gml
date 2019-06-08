var tweenTime = 0.6;

if (isFadeout) {
	if (alpha > 1) {
		isFadeout = false;
		room_goto(targetRoom);
	}
	else {
		alpha += 1 / room_speed / tweenTime;
	}
}
else {
	if (alpha < 0) {
		instance_destroy();
	}
	else {
		alpha -= 1 / room_speed / tweenTime;
	}
}