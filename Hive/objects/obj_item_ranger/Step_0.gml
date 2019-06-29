switch (global.chrMap[? "rangerWeapon"]) {
	case "pistol":
		price = 4;
		name = "D.이글";
		sprite_index = spr_weapon_deagle;
		break;
	case "deagle":
		price = 5;
		name = "UZI";
		sprite_index = spr_weapon_uzi;
		break;
	case "uzi":
		price = 7;
		name = "산탄총";
		sprite_index = spr_weapon_shotgun;
		break;
	case "shotgun":
		price = 10;
		name = "저격총";
		sprite_index = spr_weapon_sniper;
		break;
	default:
		isSold = true;
		break;
}

event_inherited();

