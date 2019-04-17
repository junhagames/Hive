/// @description 캐릭터 각도 조절

weaponAngle = point_direction(x, y, mouse_x, mouse_y);

if (weaponAngle > 90 && weaponAngle < 270) {
	weaponDir = -1;
}
else {
	weaponDir = 1;
}