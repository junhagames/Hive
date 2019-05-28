/// @description 캐릭터 스킬

if (!isSkillDelay) {
	if (os_type == os_windows && mouse_check_button_pressed(mb_right)) {
		// TODO 스킬추가
		isSkillDelay = true;
		alarm[ALARM_CHR.SKILL] = skillSpeed;
	}
}