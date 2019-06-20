/// @description 가상 키 그리기
/// @param vkeyID

var vkeyID = argument0;

draw_sprite_ext(global.vkey[vkeyID, VKEY_SETTING.SPRITE], 0, global.vkey[vkeyID, VKEY_SETTING.X], global.vkey[vkeyID, VKEY_SETTING.Y], 1, 1, 0, c_white, 0.2 + global.vkey[vkeyID, VKEY_SETTING.CHECK] * 0.3);

if (vkeyID == VKEY.ATTACK) {
	draw_sprite_ext(global.cursorSprite, 0, global.vkey[vkeyID, VKEY_SETTING.X], global.vkey[vkeyID, VKEY_SETTING.Y] - 8, 2, 2, 0, c_white, 0.2 + global.vkey[vkeyID, VKEY_SETTING.CHECK] * 0.3);
}
else if (vkeyID == VKEY.DASH) {
	draw_sprite_part_ext(spr_vkey_dash, 1, 0, 0,
		sprite_get_width(spr_vkey_dash), sprite_get_height(spr_vkey_dash) - obj_chr.alarm[ALARM_CHR.DASH] / obj_chr.dashSpeed * sprite_get_height(spr_vkey_dash),
		global.vkey[vkeyID, VKEY_SETTING.X] - sprite_get_width(spr_vkey_dash) / 2, global.vkey[vkeyID, VKEY_SETTING.Y] - sprite_get_height(spr_vkey_dash) / 2,
		1, 1, c_white, 0.2 + global.vkey[vkeyID, VKEY_SETTING.CHECK] * 0.3);
}
else if (vkeyID == VKEY.SKILL) {
	draw_sprite_part_ext(spr_vkey_skill, 1, 0, 0,
		sprite_get_width(spr_vkey_skill), sprite_get_height(spr_vkey_skill) - obj_chr.alarm[ALARM_CHR.SKILL] / global.chrMap[? "skillSpeed"] * sprite_get_height(spr_vkey_skill),
		global.vkey[vkeyID, VKEY_SETTING.X] - sprite_get_width(spr_vkey_skill) / 2, global.vkey[vkeyID, VKEY_SETTING.Y] - sprite_get_height(spr_vkey_skill) / 2,
		1, 1, c_white, 0.2 + global.vkey[vkeyID, VKEY_SETTING.CHECK] * 0.3);
}