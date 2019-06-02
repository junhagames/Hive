camera = camera_create();
target = obj_chr;
shake = 0;

var _x = 1280;
var _y = 720;

if (instance_exists(target)) {
	x = median(_x / 2, target.x, room_width - _x / 2);
	y = median(_y / 2, target.y, room_height - _y / 2);
}

if (!view_enabled) {
	var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(_x, _y, 1, 3200);
	view_set_wport(0, _x);
	view_set_hport(0, _y);
	view_set_visible(0, true);
	camera_set_view_size(camera, _x, _y);
	camera_set_view_mat(camera, vm);
	camera_set_proj_mat(camera, pm);
	view_camera[0] = camera;
	view_enabled = true;
}