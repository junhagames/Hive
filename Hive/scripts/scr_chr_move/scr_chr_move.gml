/// @description 캐릭터 이동

var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));
var keyUp = keyboard_check(ord("W"));
var keyDown = keyboard_check(ord("S"));

var hspd = (keyRight - keyLeft) * global.chrMap[? "speed"];
var vspd = (keyDown - keyUp) * global.chrMap[? "speed"];
isMove = hspd != 0 || vspd != 0;

if (isMove) {
	if (place_meeting(x + hspd, y, obj_solid_block)) {
		while (!place_meeting(x + sign(hspd), y, obj_solid_block)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	if (place_meeting(x, y + vspd, obj_solid_block)) {
		while (!place_meeting(x, y + sign(vspd), obj_solid_block)) {
			y += sign(vspd);
		}
		vspd = 0;
	}

	var moveDir = point_direction(0, 0, hspd, vspd);
	x += lengthdir_x(abs(hspd), moveDir);
	y += lengthdir_y(abs(vspd), moveDir);
}