/// @description 값 증가
/// @param val
/// @param src
/// @param dest
/// @param time

var val = argument0;
var src = argument1;
var dest = argument2;
var time = argument3;

return val + (dest - src) / room_speed * time;