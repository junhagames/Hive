if (!instance_exists(obj_parent_transition)) {
	scr_world_reset("city", 50, 11, 11);
	scr_chr_reset("commando", 100, 2, 1, 5, room_speed * 10, "degle", 5, room_speed * 0.2, 4, 15, "plunger", 3, room_speed * 0.1);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(scr_world_room_index(0));

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_city;
	audio_play_sound(global.bgmPlaying, 0, true);
}