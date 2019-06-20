if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("city", 50, 11, 11);
	scr_chr_reset("firefighter", 70, 0, 1, 5, room_speed * 10, "sniper", 30, room_speed * 0.4, 0, 4, "bat", 6, room_speed * 0.3);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(room_story);

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_city;
	audio_play_sound(global.bgmPlaying, 0, true);
}