/// @description 카메라 설정
/// @param target

var target = argument0;

if (instance_exists(target)) {
	//	Move
	x = lerp(target.x, mouse_x, 0.2);
	y = lerp(target.y, mouse_y, 0.2);
}
x = clamp(x, global.gameWidth / 2, room_width - global.gameWidth / 2);
y = clamp(y, global.gameHeight / 2, room_height - global.gameHeight / 2);

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);