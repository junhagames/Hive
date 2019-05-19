switch (global.chrMap[? "class"]) {
	case "worker":
		chrSprite = spr_chr_worker;
		break;
	case "soldier":
		chrSprite = spr_chr_soldier;
		break;
}
rangerSprite = spr_weapon_pistol;
warriorSprite = spr_weapon_bat;
weaponLength = 16;
weaponAngle = 0;
weaponDir = 1;
warriorDir = 1;

isMove = false;
isRoll = false;
isAttackDelay = false;
isSkillDelay = false;
isDamageDelay = false;
isSwapDelay = false;
isRollDelay = false;

skillSpeed = room_speed * 10;
damageSpeed = room_speed;
swapSpeed = room_speed * 0.2;
rollSpeed = room_speed * 2;

global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];