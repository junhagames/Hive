audio_group_set_gain(audiogroup_bgm, global.bgmVolume, 0);
audio_group_set_gain(audiogroup_sfx, global.sfxVolume, 0);

if (window_get_width() != global.gameWidth &&
	window_get_height() != global.gameHeight) {
	window_set_size(global.gameWidth, global.gameHeight);
	display_set_gui_size(global.gameWidth, global.gameHeight);
	surface_resize(application_surface, global.gameWidth, global.gameHeight);
}