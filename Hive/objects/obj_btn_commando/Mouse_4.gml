scr_world_reset("city", 20, 11, 11);
scr_chr_reset("commando", 100, 2, 1, 5, room_speed * 10, "pistol", 2, room_speed * 0.13, 4, 20, "bat", 8, room_speed * 0.3);
scr_save_file(SAVE_FILE);
var transition = instance_create_layer(0, 0, "layer_system", obj_transition_fadeout);
transition.targetRoom = scr_world_room_index(0);

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_city;
audio_play_sound(global.bgmPlaying, 0, true);