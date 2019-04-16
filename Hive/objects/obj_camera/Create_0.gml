camera = camera_create();
target = obj_chr;

if (instance_exists(target)) {
	x = median(global.gameWidth / 2, target.x, room_width - global.gameWidth / 2);
	y = median(global.gameHeight / 2, target.y, room_height - global.gameHeight / 2);
}

if (!view_enabled) {
	var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(global.gameWidth, global.gameHeight, 1, 3200);
	view_set_wport(0, global.gameWidth);
	view_set_hport(0, global.gameHeight);
	view_set_visible(0, true);
	camera_set_view_size(camera, global.gameWidth, global.gameHeight);
	camera_set_view_mat(camera, vm);
	camera_set_proj_mat(camera, pm);
	view_camera[0] = camera;
	view_enabled = true;
}