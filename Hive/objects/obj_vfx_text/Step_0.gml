var tweenTime = 0.6;

if (alpha > 0) {
	alpha -= 1 / room_speed / tweenTime;
}
else {
	instance_destroy();
}
y--;