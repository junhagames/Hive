camera = camera_create();
vm = matrix_build_lookat(0, 0, -10, 0, 0, 0, 0, 1, 0);
pm = matrix_build_projection_ortho(global.gameWidth, global.gameHeight, 1, 3200);

if (!view_enabled) {
	view_set_wport(0, global.gameWidth);
	view_set_hport(0, global.gameHeight);
	view_set_visible(0, true);
	camera_set_view_size(camera, global.gameWidth, global.gameHeight);
	camera_set_view_mat(camera, vm);
	camera_set_proj_mat(camera, pm);
	view_camera[0] = camera;
	view_enabled = true;
}

camera_shake = 0;