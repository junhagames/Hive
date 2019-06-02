/// @description 가상 키 초기화
/// @param vkeyID
/// @param x
/// @param y
/// @param radius
/// @param sprite

var vkeyID = argument0;
var _x = argument1;
var _y = argument2;
var radius = argument3;
var sprite = argument4;

global.vkey[vkeyID, VKEY_SETTING.DEVICE_ID] = -1;
global.vkey[vkeyID, VKEY_SETTING.X] = _x;
global.vkey[vkeyID, VKEY_SETTING.Y] = _y;
global.vkey[vkeyID, VKEY_SETTING.RADIUS] = radius;
global.vkey[vkeyID, VKEY_SETTING.CHECK] = false;
global.vkey[vkeyID, VKEY_SETTING.PRESSED] = false;
global.vkey[vkeyID, VKEY_SETTING.RELEASED] = false;
global.vkey[vkeyID, VKEY_SETTING.SPRITE] = sprite;