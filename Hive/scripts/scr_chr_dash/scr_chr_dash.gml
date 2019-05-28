/// @description 캐릭터 대시

if (!isdashDelay && isMove) {
	if (os_type == os_windows && keyboard_check_pressed(vk_space)) {
		var isLeft = keyboard_check(ord("A"));
		var isRight = keyboard_check(ord("D"));
		var isUp = keyboard_check(ord("W"));
		var isDown = keyboard_check(ord("S"));
		moveDir = point_direction(0, 0, isRight - isLeft, isDown - isUp);
		
		var _dashPower = 20;
		
		if (!place_meeting(x + lengthdir_x(_dashPower, moveDir), y + lengthdir_y(_dashPower, moveDir), obj_parent_solid)) {
			dashPower = _dashPower;
			isdashDelay = true;
			alarm[ALARM_CHR.DASH] = dashSpeed;
		}
	}
}	