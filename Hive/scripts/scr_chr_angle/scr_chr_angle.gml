/// @description 캐릭터 각도 조정

angle = point_direction(x, y, mouse_x, mouse_y);

if (angle > 90 && angle < 270) {
	xdir = -1;
}
else {
	xdir = 1;
}