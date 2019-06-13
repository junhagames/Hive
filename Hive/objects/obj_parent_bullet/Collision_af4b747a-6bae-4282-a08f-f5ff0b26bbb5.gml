if (ds_list_find_index(penetrateList, other.id) == -1) {
	other.hp -=  damage;
	penetrate++;

	if (penetrate < penetrateMax) {
		ds_list_add(penetrateList, other.id);
		
		if (penetrate == 1) {
			damage = floor(damage / 2);
		}
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
	scr_vfx_bullet_hit(image_angle);
}