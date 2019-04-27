/// @description 카메라 업데이트
/// @param target

var target = argument0;

if (instance_exists(target)) {
	x = median(global.gameWidth / 2, scr_tween_to(x, lerp(target.x, mouse_x, 0.1), 3), room_width - global.gameWidth / 2);
	y = median(global.gameHeight / 2, scr_tween_to(y, lerp(target.y, mouse_y, 0.1), 3), room_height - global.gameHeight / 2);
}
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);