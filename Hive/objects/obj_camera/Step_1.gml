if (window_get_width() != global.gameWidth * global.zoom &&
	window_get_height() != global.gameHeight * global.zoom) {
	window_set_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
	surface_resize(application_surface, global.gameWidth * global.resolution, global.gameHeight * global.resolution);
	display_set_gui_size(global.gameWidth, global.gameHeight);
}