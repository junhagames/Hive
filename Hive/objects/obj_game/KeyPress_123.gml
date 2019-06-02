/// @description 전체화면 설정

if (window_get_fullscreen()) {
	window_set_fullscreen(false);
}
else {
	window_set_fullscreen(true);
}