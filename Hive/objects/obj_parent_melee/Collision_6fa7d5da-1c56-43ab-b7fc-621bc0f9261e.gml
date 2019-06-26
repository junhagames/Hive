if (ds_list_find_index(penetrateList, other.id) == -1) {
	other.hp -= damage;
	penetrate++;

	if (penetrate < penetrateMax) {
		ds_list_add(penetrateList, other.id);
	}
	else {
		instance_destroy();
	}
	
	if (other.hp <= 0) {
		instance_destroy(other);
	}
	else if (!other.isHit) {
		other.isHit = true;
		other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
	}
}