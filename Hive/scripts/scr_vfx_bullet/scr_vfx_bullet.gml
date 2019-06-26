/// @description 총알 탄약 효과 생성
/// @param sprite

var sprite = argument0;

var vfx = instance_create_layer(x, y, "layer_below", obj_vfx_bullet);
vfx.sprite_index = sprite;
vfx.vspeed = random_range(6, 8);
vfx.hspeed = random_range(6, 8);
vfx.friction = 0.6;
vfx.direction = random(360);
vfx.image_angle = vfx.direction;