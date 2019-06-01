var fileName = "save.sav";

if (file_exists(fileName)) {
	scr_load_file(fileName);
	scr_world_room_goto(0);
	
	// 배경음악 재생
	audio_stop_sound(global.bgmPlaying);

	global.bgmPlaying = bgm_city;
	audio_play_sound(global.bgmPlaying, 0, true);
}
else {
	show_message_async("세이브 파일이 존재하지 않습니다!");
}