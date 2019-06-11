other.hp -= damage;

if (other.hp <= 0) {
	instance_destroy(other);
}
else {
	if (!other.isHit) {
		other.isHit = true;
		other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
	}
	scr_vfx_text(random_range(other.x - 15, other.x + 15), other.y - other.sprite_height, damage, c_white);
}