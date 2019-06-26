if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("school", 50, 11, 11);
	scr_chr_reset("firefighter", 65, 0, 1, 5, room_speed * 10, "pistol", PISTOL.DAMAGE, PISTOL.SPEED, PISTOL.ACCURACY, PISTOL.AMMO, "axe", AXE.DAMAGE, AXE.SPEED);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(room_story);

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_stage;
	audio_play_sound(global.bgmPlaying, 0, true);
}