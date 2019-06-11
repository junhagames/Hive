if (!instance_exists(obj_parent_transition)) {
	scr_world_reset("city", 50, 11, 11);
	scr_chr_reset("explorer", 80, 1, 0, 6, room_speed * 10, "shotgun", 10, room_speed * 0.3, 20, 8, "chicken", 15, room_speed * 0.2);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(scr_world_room_index(0));

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_city;
	audio_play_sound(global.bgmPlaying, 0, true);
}