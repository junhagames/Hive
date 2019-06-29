/// @description 재장전 딜레이 초기화

global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
isReloadDelay = false;
audio_play_sound(sfx_ranger_reload, 10, false);
