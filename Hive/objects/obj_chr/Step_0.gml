if (!instance_exists(obj_parent_transition)) {
	scr_chr_move();
	scr_chr_weaponAngle();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
	scr_chr_dash();
}

// 무기 설정
var rangerCrosshair, warriorCrosshair;

switch (global.chrMap[? "rangerWeapon"]) {
	case "pistol":
		rangerSprite = spr_weapon_pistol;
		rangerCrosshair = spr_ui_crosshair_ranger;
		break;
	case "degle":
		rangerSprite = spr_weapon_deagle;
		rangerCrosshair = spr_ui_crosshair_ranger;
		break;
	case "uzi":
		rangerSprite = spr_weapon_uzi;
		rangerCrosshair = spr_ui_crosshair_ranger;
		break;
	case "shotgun":
		rangerSprite = spr_weapon_shotgun;
		rangerCrosshair = spr_ui_crosshair_ranger;
		break;
	case "sniper":
		rangerSprite = spr_weapon_sniper;
		rangerCrosshair = spr_ui_crosshair_ranger;
		break;
}

switch (global.chrMap[? "warriorWeapon"]) {
	case "bat":
		warriorSprite = spr_weapon_bat;
		warriorCrosshair = spr_ui_crosshair_warrior;
		break;
	case "axe":
		warriorSprite = spr_weapon_axe;
		warriorCrosshair = spr_ui_crosshair_warrior;
		break;
	case "crowbar":
		warriorSprite = spr_weapon_crowbar;
		warriorCrosshair = spr_ui_crosshair_warrior;
		break;
	case "hammer":
		warriorSprite = spr_weapon_hammer;
		warriorCrosshair = spr_ui_crosshair_warrior;
		break;
	case "plunger":
		warriorSprite = spr_weapon_plunger;
		warriorCrosshair = spr_ui_crosshair_warrior;
		break;
}

if (os_type == os_windows) {
	if (global.chrMap[? "swap"] == "ranger") {
		cursor_sprite = rangerCrosshair;
	}
	else if (global.chrMap[? "swap"] == "warrior") {
		cursor_sprite = warriorCrosshair;
	}
}
else if (os_type == os_android) {
	window_set_cursor(cr_none);
}

// 사망
if (global.chrMap[? "hp"] <= 0) {
	show_message_async("사망했습니다!");
	game_restart();
}