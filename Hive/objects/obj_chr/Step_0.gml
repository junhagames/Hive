if (!instance_exists(obj_transition_slide)) {
	scr_chr_move();
	scr_chr_weaponAngle();
	scr_chr_attack();
	scr_chr_skill();
	scr_chr_swap();
	scr_chr_dash();
	scr_chr_action();
}

// 무기 설정
var rangerCursor, warriorCursor;

switch (global.chrMap[? "rangerWeapon"]) {
	case "pistol":
		rangerSprite = spr_weapon_pistol;
		rangerCursor = spr_cursor_ranger1;
		break;
	case "degle":
		rangerSprite = spr_weapon_deagle;
		rangerCursor = spr_cursor_ranger1;
		break;
	case "uzi":
		rangerSprite = spr_weapon_uzi;
		rangerCursor = spr_cursor_ranger1;
		break;
	case "shotgun":
		rangerSprite = spr_weapon_shotgun;
		rangerCursor = spr_cursor_ranger2;
		break;
	case "sniper":
		rangerSprite = spr_weapon_sniper;
		rangerCursor = spr_cursor_ranger3;
		break;
}

switch (global.chrMap[? "warriorWeapon"]) {
	case "bat":
		warriorSprite = spr_weapon_bat;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "axe":
		warriorSprite = spr_weapon_axe;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "crowbar":
		warriorSprite = spr_weapon_crowbar;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "hammer":
		warriorSprite = spr_weapon_hammer;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "plunger":
		warriorSprite = spr_weapon_plunger;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "knife":
		warriorSprite = spr_weapon_knife;
		warriorCursor = spr_cursor_warrior1;
		break;
	case "chicken":
		warriorSprite = spr_weapon_chicken;
		warriorCursor = spr_cursor_warrior1;
		break;
}

if (!isAction) {
	if (global.chrMap[? "swap"] == "ranger") {
		global.cursorSprite = rangerCursor;
	}
	else if (global.chrMap[? "swap"] == "warrior") {
		global.cursorSprite = warriorCursor;
	}
}
else {
	global.cursorSprite = spr_cursor_action;
}
	
// 캐릭터 사망
if (global.chrMap[? "hp"] <= 0) {
	show_message_async("사망했습니다!");
	file_delete(SAVE_FILE); 
	room_goto(room_title);
}