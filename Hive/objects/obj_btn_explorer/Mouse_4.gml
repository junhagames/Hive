global.chrMap[? "class"] = "explorer";
global.chrMap[? "hpMax"] = 80;
global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
global.chrMap[? "power"] = 1;
global.chrMap[? "armor"] = 0;
global.chrMap[? "speed"] = 6;

global.chrMap[? "ammoMax"] = 20;
global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
global.chrMap[? "rangerWeapon"] = "pistol";
global.chrMap[? "rangerDamage"] = 2;
global.chrMap[? "rangerSpeed"] = room_speed * 0.13;
global.chrMap[? "rangerAccuracy"] = 4;
global.chrMap[? "warriorWeapon"] = "bat";
global.chrMap[? "warriorDamage"] = 8;
global.chrMap[? "warriorSpeed"] = room_speed * 0.3;

scr_world_reset("city", 20, 11, 11);
scr_save_file("save.sav");
scr_world_room_goto(0);

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_city;
audio_play_sound(global.bgmPlaying, 0, true);