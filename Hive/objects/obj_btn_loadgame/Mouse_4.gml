if (!instance_exists(obj_transition_fadeout)) {
	if (file_exists(SAVE_FILE)) {
		scr_load_file(SAVE_FILE);
		scr_transition_fadeout(room_story);

		// 배경음악 재생
		audio_stop_sound(global.bgmPlaying);

		global.bgmPlaying = bgm_city;
		audio_play_sound(global.bgmPlaying, 0, true);
	}
}