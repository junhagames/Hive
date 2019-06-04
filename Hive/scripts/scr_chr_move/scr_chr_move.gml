/// @description 캐릭터 이동

var hspd, vspd;

if (dashPower > global.chrMap[? "moveSpeed"]) {
	// 대시 속도 설정
	hspd = lengthdir_x(dashPower, moveDir);
	vspd = lengthdir_y(dashPower, moveDir);
	dashPower = scr_tween_to(dashPower, 0, 0.06);
	isDash = true;
}
else {
	// 걷는 속도 설정
	if (os_type == os_windows) {
		var isLeft = keyboard_check(ord("A"));
		var isRight = keyboard_check(ord("D"));
		var isUp = keyboard_check(ord("W"));
		var isDown = keyboard_check(ord("S"));
		hspd = (isRight - isLeft) * global.chrMap[? "moveSpeed"];
		vspd = (isDown - isUp) * global.chrMap[? "moveSpeed"];
		moveDir = point_direction(0, 0, hspd, vspd);
	}
	else if (os_type == os_android) {
		hspd = global.vstick[VSTICK.MOVE, VSTICK_SETTING.X_AXIS] * global.chrMap[? "moveSpeed"];
		vspd = global.vstick[VSTICK.MOVE, VSTICK_SETTING.Y_AXIS] * global.chrMap[? "moveSpeed"];
		moveDir = global.vstick[VSTICK.MOVE, VSTICK_SETTING.DIRECTION];
	}
	isDash = false;
}
isMove = hspd != 0 || vspd != 0;

if (isMove) {
	if (place_meeting(x + hspd, y, obj_parent_solid)) {
		while (!place_meeting(x + sign(hspd), y, obj_parent_solid)) {
			x += sign(hspd);
		}
		hspd = 0;
		dashPower = 0;
	}

	if (place_meeting(x, y + vspd, obj_parent_solid)) {
		while (!place_meeting(x, y + sign(vspd), obj_parent_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
		dashPower = 0;
	}
	x += lengthdir_x(abs(hspd), moveDir);
	y += lengthdir_y(abs(vspd), moveDir);
}