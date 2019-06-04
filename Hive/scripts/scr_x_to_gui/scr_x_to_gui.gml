/// @description GUI x위치 반환
/// @param x

var _x = argument0;

return (_x - obj_camera.x) / global.cameraWidth * global.gameWidth + global.gameWidth / 2;