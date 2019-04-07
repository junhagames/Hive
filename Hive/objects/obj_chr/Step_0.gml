scr_chr_move();
scr_chr_angle();
scr_chr_attack();
scr_chr_swap();

if (global.chrStatus[? "rangerAmmo"] < global.chrStatus[? "rangerAmmoMax"] && alarm[1] == -1) {
	alarm[1] = room_speed * 2;
}

if (global.chrStatus[? "swap"] == SWAP.RANGER) {
	weaponSprite = spr_ranger_weapon1;
}
else {
	weaponSprite = spr_warrior_weapon1;
}

if (global.chrStatus[? "hp"] < 0) {
	show_message("사망했습니다!");
	game_restart();
}