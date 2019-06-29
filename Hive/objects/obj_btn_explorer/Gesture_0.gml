if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("school", 50, 11, 11);
	scr_chr_reset("explorer", 40, 1, 0, 5.5, room_speed * 10, "pistol", PISTOL.DAMAGE, PISTOL.SPEED, PISTOL.ACCURACY, PISTOL.AMMO, "crowbar", CROWBAR.DAMAGE, CROWBAR.SPEED);
	scr_save_file(SAVE_FILE);
	scr_transition_fadeout(room_story);
	audio_play_sound(sfx_button_click, 10, false);

	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_stage;
	audio_play_sound(global.bgmPlaying, 0, true);
}