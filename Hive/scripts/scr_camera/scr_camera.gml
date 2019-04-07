/// @description 카메라 설정
/// @param lengthMax
/// @param moveSpeed
/// @param scaleSpeed
/// @param shakeSpeed

var lengthMax = argument0;
var moveSpeed = argument1;
var scaleSpeed = argument2;
var shakeSpeed = argument3;

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
x += (target_x - x) / moveSpeed;
y += (target_y - y) / moveSpeed;
camera_set_view_pos(camera,
	x - camera_get_view_width(camera) / 2,
	y - camera_get_view_height(camera) / 2);

//	Zoom
camera_set_view_size(camera,
	camera_get_view_width(camera) + (global.gameWidth - camera_get_view_width(camera)) / scaleSpeed,
	camera_get_view_height(camera) + (global.gameHeight - camera_get_view_height(camera)) / scaleSpeed);

//	Shake
camera_set_view_pos(camera,
	camera_get_view_x(camera) + random_range(-shake, shake),
	camera_get_view_y(camera) + random_range(-shake, shake));

camera_set_view_angle(camera,
	random_range(-shake, shake));
	
if (shake > 0) {
    shake -= shake / shakeSpeed;
}