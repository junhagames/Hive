/// @description 카메라 줌

var zoomSize = argument0;

with (obj_camera) {
	camera_set_view_size(camera, global.gameWidth / zoomSize, global.gameHeight / zoomSize);
	camera_set_view_pos(camera,
		x - camera_get_view_width(camera) / 2,
		y - camera_get_view_height(camera) / 2);
}