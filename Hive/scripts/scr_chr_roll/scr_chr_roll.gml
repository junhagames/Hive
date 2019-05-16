/// @description 캐릭터 구르기

if (keyboard_check_pressed(vk_space)) {
	if (!isRollDelay) {
		isRoll = true;
		isRollDelay = true;
		alarm[ALARM_CHR.ROLL] = rollSpeed;
	}
}