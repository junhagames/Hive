/// @description 캐릭터 이동

var isLeft = keyboard_check(ord("A"));
var isRight = keyboard_check(ord("D"));
var isUp = keyboard_check(ord("W"));
var isDown = keyboard_check(ord("S"));
var hspd, vspd;

if (dashPower > global.chrMap[? "speed"]) {
	hspd = lengthdir_x(dashPower, moveDir);
	vspd = lengthdir_y(dashPower, moveDir);
}
else {
	hspd = (isRight - isLeft) * global.chrMap[? "speed"];
	vspd = (isDown - isUp) * global.chrMap[? "speed"];
	moveDir = point_direction(0, 0, hspd, vspd);
}

isMove = hspd != 0 || vspd != 0;

if (isMove) {
	if (place_meeting(x + hspd, y, obj_parent_solid)) {
		while (!place_meeting(x + sign(hspd), y, obj_parent_solid)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	if (place_meeting(x, y + vspd, obj_parent_solid)) {
		while (!place_meeting(x, y + sign(vspd), obj_parent_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	x += lengthdir_x(abs(hspd), moveDir);
	y += lengthdir_y(abs(vspd), moveDir);
}
dashPower = scr_tween_to(dashPower, 0, 0.1);

// 캐릭터 무기 방향 조절
weaponAngle = point_direction(x, y, mouse_x, mouse_y);

if (weaponAngle > 90 && weaponAngle < 270) {
	weaponDir = -1;
}
else {
	weaponDir = 1;
}