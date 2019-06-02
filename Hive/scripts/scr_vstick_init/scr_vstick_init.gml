/// @description 가상 조이스틱 초기화
/// @param vstickID
/// @param fixed
/// @param centerX
/// @param centerY
/// @param radius
/// @param backSprite
/// @param frontSprite

var vstickID = argument0;
var fixed = argument1
var centerX = argument2;
var centerY = argument3;
var radius = argument4;
var backSprite = argument5;
var frontSprite = argument6;

global.vstick[vstickID, VSTICK_SETTING.DEVICE_ID] = -1;
global.vstick[vstickID, VSTICK_SETTING.FIXED] = fixed;
global.vstick[vstickID, VSTICK_SETTING.CENTER_X] = centerX;
global.vstick[vstickID, VSTICK_SETTING.CENTER_Y] = centerY;
global.vstick[vstickID, VSTICK_SETTING.X] = centerX;
global.vstick[vstickID, VSTICK_SETTING.Y] = centerY;
global.vstick[vstickID, VSTICK_SETTING.RADIUS] = radius;
global.vstick[vstickID, VSTICK_SETTING.DISTANCE] = 0;
global.vstick[vstickID, VSTICK_SETTING.X_AXIS] = 0;
global.vstick[vstickID, VSTICK_SETTING.Y_AXIS] = 0;
global.vstick[vstickID, VSTICK_SETTING.DIRECTION] = 0;
global.vstick[vstickID, VSTICK_SETTING.CHECK] = false;
global.vstick[vstickID, VSTICK_SETTING.PRESSED] = false;
global.vstick[vstickID, VSTICK_SETTING.RELEASED] = false;
global.vstick[vstickID, VSTICK_SETTING.DRAW_X] = centerX;
global.vstick[vstickID, VSTICK_SETTING.DRAW_Y] = centerY;
global.vstick[vstickID, VSTICK_SETTING.BACK_SPRITE] = backSprite;
global.vstick[vstickID, VSTICK_SETTING.FRONT_SPRITE] = frontSprite;