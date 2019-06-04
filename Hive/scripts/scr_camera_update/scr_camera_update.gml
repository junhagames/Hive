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
		mx = (global.vstick[VSTICK.MOVE, VSTICK_SETTING.X] - global.vstick[VSTICK.MOVE, VSTICK_SETTING.CENTER_X]) / (global.vstick[VSTICK.MOVE, VSTICK_SETTING.RADIUS] * 2) * global.cameraWidth + target.x;
		my = (global.vstick[VSTICK.MOVE, VSTICK_SETTING.Y] - global.vstick[VSTICK.MOVE, VSTICK_SETTING.CENTER_Y]) / (global.vstick[VSTICK.MOVE, VSTICK_SETTING.RADIUS] * 2) * global.cameraHeight + target.y;
	}
	x = median(global.cameraWidth / 2, scr_tween_to(x, lerp(target.x, mx, 0.1), 0.3), room_width - global.cameraWidth / 2);
	y = median(global.cameraHeight / 2, scr_tween_to(y, lerp(target.y, my, 0.1), 0.3), room_height - global.cameraHeight / 2);
}

// 카메라 흔들기
shake = scr_tween_to(shake, 0, 0.3);
x += random_range(-shake, shake);
y += random_range(-shake, shake);

// 카메라 업데이트
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);