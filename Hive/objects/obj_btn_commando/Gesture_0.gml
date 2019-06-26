if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("school", 50, 11, 11);
	scr_chr_reset("commando", 60, 2, 0, 5, room_speed * 10, "deagle", DEAGLE.DAMAGE, DEAGLE.SPEED, DEAGLE.ACCURACY, DEAGLE.AMMO, "bat", BAT.DAMAGE, BAT.SPEED);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(room_story);

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_stage;
	audio_play_sound(global.bgmPlaying, 0, true);
}