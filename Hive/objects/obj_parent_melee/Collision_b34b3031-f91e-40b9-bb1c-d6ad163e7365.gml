other.hp -= damage;

if (!other.isHit) {
	other.isHit = true;
	other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
}