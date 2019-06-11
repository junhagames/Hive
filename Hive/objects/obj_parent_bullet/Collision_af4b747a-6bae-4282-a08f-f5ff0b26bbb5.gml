other.hp -= damage;

if (other.hp <= 0) {
	instance_destroy(other);
}
else if (!other.isHit) {
	other.isHit = true;
	other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
}
instance_destroy();