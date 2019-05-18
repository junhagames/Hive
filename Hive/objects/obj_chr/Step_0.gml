if (!instance_exists(obj_parent_transition)) {
	scr_chr_move();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
	scr_chr_roll();
}
	
// 무기 스프라이트 설정
if (global.chrMap[? "swap"] == "ranger") {
	switch (global.chrMap[? "rangerWeapon"]) {
		case "pistol":
			weaponSprite = spr_weapon_pistol;
			break;
		case "degle":
			weaponSprite = spr_weapon_deagle;
			break;
		case "uzi":
			weaponSprite = spr_weapon_uzi;
			break;
		case "shotgun":
			weaponSprite = spr_weapon_shotgun;
			break;
		case "sniper":
			weaponSprite = spr_weapon_sniper;
			break;
	}
	cursor_sprite = spr_ui_crosshair_ranger;
}
else if (global.chrMap[? "swap"] == "warrior") {
	switch (global.chrMap[? "warriorWeapon"]) {
		case "bat":
			weaponSprite = spr_weapon_bat;
			break;
		case "axe":
			weaponSprite = spr_weapon_axe;
			break;
		case "crowbar":
			weaponSprite = spr_weapon_crowbar;
			break;
		case "hammer":
			weaponSprite = spr_weapon_hammer;
			break;
		case "plunger":
			weaponSprite = spr_weapon_plunger;
			break;
	}
	cursor_sprite = spr_ui_crosshair_warrior;
}

// 사망
if (global.chrMap[? "hp"] < 1) {
	show_message("사망했습니다!");
	game_restart();
}