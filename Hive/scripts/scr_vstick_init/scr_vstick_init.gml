/// @description 가상 조이스틱 초기화
/// @param vstickID
/// @param fixed
/// @param fixedX
/// @param fixedY
/// @param radius
/// @param backSprite
/// @param frontSprite

var vstickID = argument0;
var fixed = argument1
var fixedX = argument2;
var fixedY = argument3;
var radius = argument4;
var backSprite = argument5;
var frontSprite = argument6;

global.vstick[vstickID, VSTICK_SETTING.ACTIVE] = true;
global.vstick[vstickID, VSTICK_SETTING.DEVICE_ID] = -1;
global.vstick[vstickID, VSTICK_SETTING.FIXED] = fixed;
global.vstick[vstickID, VSTICK_SETTING.FIXED_X] = fixedX;
global.vstick[vstickID, VSTICK_SETTING.FIXED_Y] = fixedY;
global.vstick[vstickID, VSTICK_SETTING.CENTER_X] = fixedX;
global.vstick[vstickID, VSTICK_SETTING.CENTER_Y] = fixedY;
global.vstick[vstickID, VSTICK_SETTING.X] = fixedX;
global.vstick[vstickID, VSTICK_SETTING.Y] = fixedY;
global.vstick[vstickID, VSTICK_SETTING.RADIUS] = radius;
global.vstick[vstickID, VSTICK_SETTING.X_AXIS] = 0;
global.vstick[vstickID, VSTICK_SETTING.Y_AXIS] = 0;
global.vstick[vstickID, VSTICK_SETTING.DIRECTION] = 0;
global.vstick[vstickID, VSTICK_SETTING.CHECK] = false;
global.vstick[vstickID, VSTICK_SETTING.PRESSED] = false;
global.vstick[vstickID, VSTICK_SETTING.RELEASED] = false;
global.vstick[vstickID, VSTICK_SETTING.DRAW_X] = fixedX;
global.vstick[vstickID, VSTICK_SETTING.DRAW_Y] = fixedY;
global.vstick[vstickID, VSTICK_SETTING.BACK_SPRITE] = backSprite;
global.vstick[vstickID, VSTICK_SETTING.FRONT_SPRITE] = frontSprite;