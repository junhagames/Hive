/// @description 카메라 설정
/// @param lengthMax
/// @param moveSpeed
/// @param scaleSpeed

var lengthMax = argument0;
var moveSpeed = argument1;
var scaleSpeed = argument2;

var target_x, target_y;

with (obj_chr) {
	if (distance_to_point(mouse_x, mouse_y) < lengthMax) {
		target_x = mouse_x;
		target_y = mouse_y;
	}
	else {
		var mouseDir = point_direction(x, y, mouse_x, mouse_y);
		target_x = x + lengthdir_x(lengthMax, mouseDir);
		target_y = y + lengthdir_y(lengthMax, mouseDir);
	}
}

//	Move
camera_x = median(global.gameWidth / 2, (camera_x + (target_x - camera_x) / moveSpeed), room_width - global.gameWidth / 2);
camera_y = median(global.gameHeight / 2, (camera_y + (target_y - camera_y) / moveSpeed), room_height - global.gameHeight / 2);
camera_set_view_pos(camera,
	camera_x - camera_get_view_width(camera) / 2,
	camera_y - camera_get_view_height(camera) / 2);

//	Zoom
camera_set_view_size(camera,
	camera_get_view_width(camera) + (global.gameWidth - camera_get_view_width(camera)) / scaleSpeed,
	camera_get_view_height(camera) + (global.gameHeight - camera_get_view_height(camera)) / scaleSpeed);

//	Shake
camera_set_view_pos(camera,
	camera_get_view_x(camera) + random_range(-camera_shake, camera_shake),
	camera_get_view_y(camera) + random_range(-camera_shake, camera_shake));

camera_set_view_angle(camera,
	random_range(-camera_shake, camera_shake));
	
if (camera_shake > 0) {
    camera_shake -= camera_shake / 4;
}