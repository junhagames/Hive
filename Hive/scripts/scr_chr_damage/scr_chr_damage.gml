/// @description 캐릭터 피격

if (!isDamageDelay) {
	global.chrMap[? "hp"] -= max(other.damage - global.chrMap[? "armor"], 1);
	isDamageDelay = true;
	alarm[ALARM_CHR.DAMAGE] = damageSpeed;
}