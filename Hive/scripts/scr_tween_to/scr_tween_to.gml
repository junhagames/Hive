/// @description 부드러운 애니메이션
/// @param src
/// @param dest
/// @param speed

var src = argument0;
var dest = argument1;
var _speed = argument2;

return src + (dest - src) * _speed;