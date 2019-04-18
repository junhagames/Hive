if (!isDamageDelay) {
	global.chrStatus[? "hp"] -= max(other.damage - global.chrStatus[? "armor"], 0);
	isDamageDelay = true;
	alarm[ALARM_CHR.DAMAGE] = room_speed;
}