/// @description 텍스트 효과 생성
/// @param x
/// @param y
/// @param text
/// @param color

var _x = argument0;
var _y = argument1;
var text = argument2;
var color = argument3;

var vfx = instance_create_layer(random_range(_x - 15, _x + 15), _y, "layer_vfx", obj_vfx_text);
vfx.text = text;
vfx.color = color;