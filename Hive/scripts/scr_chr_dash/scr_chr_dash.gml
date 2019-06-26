/// @description 캐릭터 대시

if (!isDashDelay && isMove) {
	if ((os_type == os_windows && keyboard_check_pressed(vk_space)) ||
		(os_type == os_android && global.vkey[VKEY.DASH, VKEY_SETTING.PRESSED])) {
		var _dashPower = 20;
		
		if (!place_meeting(x + lengthdir_x(_dashPower, moveDir), y + lengthdir_y(_dashPower, moveDir), obj_parent_solid)) {
			dashPower = _dashPower;
			isDashDelay = true;
			alarm[ALARM_CHR.DASH] = dashSpeed;
		}
	}
}	