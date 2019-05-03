/// @description 부드러운 애니메이션
/// @param src
/// @param dest
/// @param spd

var src = argument0;
var dest = argument1;
var spd = argument2;

return src + (dest - src) / spd;

x += (mouse_x - x) / spd;
x += (mouse_y - y) / spd;