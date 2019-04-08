scr_chr_move();
scr_chr_angle();
scr_chr_attack();
scr_chr_swap();

// Reload
if (global.chrStatus[? "rangerAmmo"] < global.chrStatus[? "rangerAmmoMax"] && alarm[1] == -1) {
	alarm[1] = room_speed * 2;
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