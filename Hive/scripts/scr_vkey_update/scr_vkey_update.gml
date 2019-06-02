/// @description 가상 키 업데이트
/// @param vkeyID

var vkeyID = argument0;

// 가상 키 입력 초기화
global.vkey[vkeyID, VKEY_SETTING.PRESSED] = false;
global.vkey[vkeyID, VKEY_SETTING.RELEASED] = false;

// 가상 키 눌렸을 때
for (var i = 0; i < 5; i++) {
	if (device_mouse_check_button_pressed(i, mb_left)) {
		if (point_distance(global.vkey[vkeyID, VKEY_SETTING.X], global.vkey[vkeyID, VKEY_SETTING.Y], device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < global.vkey[vkeyID, VKEY_SETTING.RADIUS]) {
			global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID] = i;
			global.vkey[vkeyID, VKEY_SETTING.CHECK] = true;
			global.vkey[vkeyID, VKEY_SETTING.PRESSED] = true;
			break;
		}
	}
}

// 가상 키 땠을 때
if (global.vkey[vkeyID, VKEY_SETTING.CHECK]) {
	var mx = device_mouse_x_to_gui(global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID]);
	var my = device_mouse_y_to_gui(global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID]);
	
	if ((point_distance(global.vkey[vkeyID, VKEY_SETTING.X], global.vkey[vkeyID, VKEY_SETTING.Y], mx, my) > global.vkey[vkeyID, VKEY_SETTING.RADIUS]) ||
		device_mouse_check_button_released(global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID], mb_left)) {
		global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID] = -1;
		global.vkey[vkeyID, VKEY_SETTING.CHECK] = false;
		global.vkey[vkeyID, VKEY_SETTING.RELEASED] = true;
	}
}
