if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("city", 50, 11, 11);
	scr_chr_reset("firefighter", 40, 1, 2, 5, room_speed * 10, "sniper", 50, room_speed * 0.4, 0, 4, "knife", 15, room_speed * 0.3);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(room_story);

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_city;
	audio_play_sound(global.bgmPlaying, 0, true);
}