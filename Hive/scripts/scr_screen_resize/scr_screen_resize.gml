/// @description 화면 설정

// 화면 크기 설정
if (window_get_width() != global.gameWidth * global.zoom &&
	window_get_height() != global.gameHeight * global.zoom) {
	window_set_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
	display_set_gui_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
}

// 화면 해상도 설정
if (surface_get_width(application_surface) != global.gameWidth * global.resolution ||
	surface_get_height(application_surface) != global.gameHeight * global.resolution) {
	surface_resize(application_surface, global.gameWidth * global.resolution, global.gameHeight * global.resolution);
}