if (!instance_exists(obj_parent_transition)) {
	scr_chr_move();
	scr_chr_angle();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
}

// Reload
if (global.chrStatus[? "ammo"] <= 0 && alarm[ALARM_CHR.RELOAD] == -1) {
	alarm[ALARM_CHR.RELOAD] = reloadSpeed;
}
	
// Weapon sprite
if (global.chrStatus[? "swap"] == SWAP.RANGER) {
	weaponSprite = spr_ranger_weapon1;
}
else {
	weaponSprite = spr_warrior_weapon1;
}

// Dead
if (global.chrStatus[? "hp"] < 0) {
	show_message("사망했습니다!");
	game_restart();
}