if (!isDamageDelay) {
	global.chrStatus[? "hp"] -= max(other.damage - global.chrStatus[? "armor"], 0);
	isDamageDelay = true;
	alarm[2] = room_speed;
	scr_camera_shake(20);
	scr_camera_zoom(1.2);
}