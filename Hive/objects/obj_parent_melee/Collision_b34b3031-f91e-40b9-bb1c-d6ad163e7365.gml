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
		var sfx = audio_play_sound(sfx_enemy_destroy, 10, false);
		audio_sound_pitch(sfx, random_range(0.8, 1.2));
		instance_destroy(other);
	}
	else if (!other.isHit) {
		other.isHit = true;
		other.alarm[ALARM_VFX.HIT] = room_speed * 0.1;
	}
	scr_vfx_text(random_range(other.x - 15, other.x + 15), other.y - other.sprite_height, damage, c_white);
}