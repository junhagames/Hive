/// @description 캐릭터 피격

if (!isDamageDelay && !isDash) {
	var _damage = max(other.damage - global.chrMap[? "armor"], 1);
	global.chrMap[? "hp"] -= _damage;
	isDamageDelay = true;
	alarm[ALARM_CHR.DAMAGE] = damageSpeed;
	
	isHit = true;
	alarm[ALARM_VFX.HIT] = room_speed * 0.1;
	obj_game.damageAlpha = 0.3;
	scr_vfx_text(random_range(x - 15, x + 15), y - sprite_height, _damage, c_red);
}