scr_world_reset("city", 20, 11, 11);
scr_chr_reset("firefighter", 120, 1, 2, 5, room_speed * 10, "uzi", 2, room_speed * 0.08, 12, 30, "knife", 15, room_speed * 0.3);
scr_save_file(SAVE_FILE);
scr_transition_fadeout(scr_world_room_index(0));

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_city;
audio_play_sound(global.bgmPlaying, 0, true);