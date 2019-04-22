if (!instance_exists(obj_parent_transition)) {
	scr_chr_move();
	scr_chr_angle();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
}

// Reload
if (global.chrMap[? "ammo"] < 1 && alarm[ALARM_CHR.RELOAD] == -1) {
	alarm[ALARM_CHR.RELOAD] = reloadSpeed;
}
	
// Weapon sprite
if (global.chrMap[? "swap"] == SWAP.RANGER) {
	weaponSprite = spr_ranger_weapon1;
}
else if (global.chrMap[? "swap"] == SWAP.WARRIOR) {
	weaponSprite = spr_warrior_weapon1;
}

// Dead
if (global.chrMap[? "hp"] < 1) {
	show_message("사망했습니다!");
	game_restart();
}