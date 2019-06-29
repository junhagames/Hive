if (!instance_exists(obj_transition_fadeout)) {
	audio_play_sound(sfx_button_click, 10, false);
	game_end();
}