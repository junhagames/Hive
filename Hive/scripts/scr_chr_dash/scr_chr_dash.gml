/// @description 캐릭터 구르기

if (keyboard_check_pressed(vk_space)) {
	if (!isdashDelay) {
		var isLeft = keyboard_check(ord("A"));
		var isRight = keyboard_check(ord("D"));
		var isUp = keyboard_check(ord("W"));
		var isDown = keyboard_check(ord("S"));
		moveDir = point_direction(0, 0, isRight - isLeft, isDown - isUp);
		dashPower = 20;
		isdashDelay = true;
		alarm[ALARM_CHR.DASH] = dashSpeed;
	}
}