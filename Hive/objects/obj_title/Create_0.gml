sector = 0;
camera = view_camera[0];

if (os_type == os_windows) {
	platform = "WINDOWS ";
}
else if (os_type == os_android) {
	platform = "ANDROID ";
}

// 마우스 커서 초기화
global.cursorSprite = spr_cursor_normal;

// 가상 조이스틱|키 초기화
if (os_type == os_android) {
	scr_vstick_init(VSTICK.MOVE, 240, global.gameHeight - 180, sprite_get_width(spr_vstick_back) / 2, spr_vstick_back, spr_vstick_front);
	scr_vkey_init(VKEY.ATTACK, global.gameWidth - 240, global.gameHeight - 180, sprite_get_width(spr_vkey_attack) / 2, spr_vkey_attack);
	scr_vkey_init(VKEY.SKILL, global.gameWidth - 410, global.gameHeight - 100, sprite_get_width(spr_vkey_skill) / 2, spr_vkey_skill);
	scr_vkey_init(VKEY.SWAP, global.gameWidth - 70, global.gameHeight - 260, sprite_get_width(spr_vkey_swap) / 2, spr_vkey_swap);
	scr_vkey_init(VKEY.DASH, global.gameWidth - 70, global.gameHeight - 100, sprite_get_width(spr_vkey_dash) / 2, spr_vkey_dash);
	scr_vkey_init(VKEY.MINIMAP, global.gameWidth - 140, 140, 110, noone);
}

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_title;
audio_play_sound(global.bgmPlaying, 0, true);