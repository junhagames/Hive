// 화면 크기 설정
if (!window_get_fullscreen()) {
	if (keyboard_check_pressed(vk_f1)) {
		global.zoom = 1;
	}

	if (keyboard_check_pressed(vk_f2)) {
		global.zoom = 0.75;
	}
}

// 해상도 설정
if (keyboard_check_pressed(vk_f3)) {
	global.resolution = 1;
}

if (keyboard_check_pressed(vk_f4)) {
	global.resolution = 0.2;
}

// 재시작
if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}