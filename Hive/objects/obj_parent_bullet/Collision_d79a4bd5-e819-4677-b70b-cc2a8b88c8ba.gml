other.hp -= damage;

if (!other.isHit) {
	other.isHit = true;
	other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
}
scr_vfx_text(other.x, other.y - other.sprite_height, damage, c_white);
instance_destroy();