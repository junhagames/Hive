/// @description GUI y위치 반환
/// @param y

var _y = argument0;

return (_y - obj_camera.y) / global.cameraHeight * global.gameHeight + global.gameHeight / 2;