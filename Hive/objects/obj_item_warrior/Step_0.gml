switch (global.chrMap[? "warriorWeapon"]) {
	case "bat":
		price = 4;
		name = "도끼";
		sprite_index = spr_weapon_axe;
		break;
	case "axe":
		price = 6;
		name = "빠루";
		sprite_index = spr_weapon_crowbar;
		break;
	case "crowbar":
		price = 8;
		name = "오함마";
		sprite_index = spr_weapon_hammer;
		break;
	case "hammer":
		price = 10;
		name = "뚜러뻥";
		sprite_index = spr_weapon_plunger;
		break;
	case "plunger":
		price = 12;
		name = "장미칼";
		sprite_index = spr_weapon_knife;
		break;
	case "knife":
		price = 15;
		name = "닭다리";
		sprite_index = spr_weapon_chicken;
		break;
	default:
		isSold = true;
		break;
}

event_inherited();

