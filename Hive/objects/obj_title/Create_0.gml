global.cursorSprite = spr_ui_cursor_normal;

// 배경음악 재생
audio_stop_sound(global.bgmPlaying);

global.bgmPlaying = bgm_title;
audio_play_sound(global.bgmPlaying, 0, true);