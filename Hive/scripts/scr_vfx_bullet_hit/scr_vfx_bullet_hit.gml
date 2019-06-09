/// @description 총알 피격 효과 생성
/// @param angle

var angle = argument0;

var vfx = instance_create_layer(x, y, "layer_vfx", obj_vfx_bullet_hit);
vfx.image_angle = angle;