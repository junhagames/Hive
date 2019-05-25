/// @description 카메라 업데이트
/// @param target

var target = argument0;

// 카메라 이동
if (instance_exists(target)) {
	var mx, my;
	
	if (os_type == os_windows) {
		mx = mouse_x;
		my = mouse_y;
	}
	else if (os_type == os_android) {
		mx = (global.vstick[VSTICK.ATTACK, VSTICK_SETTING.X] - global.vstick[VSTICK.ATTACK, VSTICK_SETTING.FIXED_X])
			/ (global.vstick[VSTICK.ATTACK, VSTICK_SETTING.RADIUS] * 2) * global.gameWidth + target.x;
		my = (global.vstick[VSTICK.ATTACK, VSTICK_SETTING.Y] - global.vstick[VSTICK.ATTACK, VSTICK_SETTING.FIXED_Y])
			/ (global.vstick[VSTICK.ATTACK, VSTICK_SETTING.RADIUS] * 2) * global.gameHeight + target.y;
	}
	x = median(global.gameWidth / 2, scr_tween_to(x, lerp(target.x, mx, 0.1), 0.3), room_width - global.gameWidth / 2);
	y = median(global.gameHeight / 2, scr_tween_to(y, lerp(target.y, my, 0.1), 0.3), room_height - global.gameHeight / 2);
}

// 카메라 흔들기
x += random_range(-shake, shake);
y += random_range(-shake, shake);

if (shake > 0) {
    shake -= shake / 4;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);