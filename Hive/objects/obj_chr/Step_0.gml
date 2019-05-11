if (!instance_exists(obj_parent_transition)) {
	scr_chr_move();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
}
	
// 무기 스프라이트 설정
if (global.chrMap[? "swap"] == "ranger") {
	weaponSprite = spr_weapon_pistol;
}
else if (global.chrMap[? "swap"] == "warrior") {
	weaponSprite = spr_weapon_bat;
}

// 사망
if (global.chrMap[? "hp"] < 1) {
	show_message("사망했습니다!");
	game_restart();
}