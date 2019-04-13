if (!isDamageDelay) {
	global.chrStatus[? "hp"] -= max(other.damage - global.chrStatus[? "armor"], 0);
	isDamageDelay = true;
	alarm[1] = room_speed;
}