/// @description 캐릭터 피격

if (!isDamageDelay && !isDash) {
	global.chrMap[? "hp"] -= max(other.damage - global.chrMap[? "armor"], 1);
	isDamageDelay = true;
	alarm[ALARM_CHR.DAMAGE] = damageSpeed;
	
	obj_game.damageAlpha = 0.3;
}