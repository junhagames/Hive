/// @description 가상 키 그리기
/// @param vkeyID

var vkeyID = argument0;

draw_sprite_ext(global.vkey[vkeyID, VKEY_SETTING.SPRITE], 0, global.vkey[vkeyID, VKEY_SETTING.X], global.vkey[vkeyID, VKEY_SETTING.Y], 1, 1, 0, c_white, 0.1 + global.vkey[vkeyID, VKEY_SETTING.CHECK] * 0.3);