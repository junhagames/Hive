/// @description 카메라 줌

var zoomSize = argument0;
camera_set_view_size(obj_camera.camera, global.gameWidth / zoomSize, global.gameHeight / zoomSize);
camera_set_view_pos(obj_camera.camera,
	obj_camera.camera_x - camera_get_view_width(obj_camera.camera) / 2,
	obj_camera.camera_y - camera_get_view_height(obj_camera.camera) / 2);