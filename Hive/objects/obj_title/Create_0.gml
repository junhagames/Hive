global.cursorSprite = spr_cursor_normal;
sector = 0;
camera = view_camera[0];

if (os_type == os_windows) {
	platform = "WINDOWS ";
}
else if (os_type == os_android) {
	platform = "ANDROID ";
}

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_title;
audio_play_sound(global.bgmPlaying, 0, true);