/// @description 캐릭터 각도 조정

weaponAngle = point_direction(x, y, mouse_x, mouse_y);

if (weaponAngle > 90 && weaponAngle < 270) {
	xdir = -1;
}
else {
	xdir = 1;
}