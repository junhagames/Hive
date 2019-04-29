/// @description 전체화면 설정

if (window_get_fullscreen()) {
	window_set_fullscreen(false);
	global.zoom = _zoom;
}
else {
	window_set_fullscreen(true);
	_zoom = global.zoom;
	global.zoom = 1;
}