if (!isDamageDelay) {
	global.chrMap[? "hp"] -= max(other.damage - global.chrMap[? "armor"], 0);
	isDamageDelay = true;
	alarm[ALARM_CHR.DAMAGE] = room_speed;
}