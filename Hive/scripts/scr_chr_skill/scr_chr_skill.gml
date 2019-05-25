/// @description 캐릭터 스킬

if (os_type == os_windows && mouse_check_button_pressed(mb_right)) {
	if (!isDamageDelay) {
		// TODO 스킬추가
		isDamageDelay = true;
		alarm[ALARM_CHR.SKILL] = skillSpeed;
	}
}