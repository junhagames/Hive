/// @description 총알 피격 효과 생성
/// @param x
/// @param y
/// @param angle

var _x = argument0;
var _y = argument1;
var angle = argument2;

var vfx = instance_create_layer(_x, _y, "layer_vfx", obj_vfx_melee_swing);
vfx.image_angle = angle;