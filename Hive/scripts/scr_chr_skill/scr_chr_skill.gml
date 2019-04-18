/// @description 캐릭터 스킬

if (mouse_check_button_pressed(mb_right)) {
	if (!isDamageDelay) {
		// TODO add skill 
		show_message("스킬발동!");
		isDamageDelay = true;
		alarm[ALARM_CHR.SKILL] = skillSpeed;
	}
}