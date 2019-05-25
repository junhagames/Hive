/// @description 가상 조이스틱 그리기
/// @param vstickID

var vstickID = argument0;

if (global.vstick[vstickID, VSTICK_SETTING.ACTIVE]) {
	draw_sprite_ext(global.vstick[vstickID, VSTICK_SETTING.BACK_SPRITE], 0, global.vstick[vstickID, VSTICK_SETTING.CENTER_X], global.vstick[vstickID, VSTICK_SETTING.CENTER_Y], 1, 1, 0, c_white, 1);
	draw_sprite_ext(global.vstick[vstickID, VSTICK_SETTING.FRONT_SPRITE], 0, global.vstick[vstickID, VSTICK_SETTING.DRAW_X], global.vstick[vstickID, VSTICK_SETTING.DRAW_Y], 1, 1, 0, c_white, 1);
}