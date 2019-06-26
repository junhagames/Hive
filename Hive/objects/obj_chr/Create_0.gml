global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];

switch (global.chrMap[? "class"]) {
	case "commando":
		chrSprite = spr_chr_commando;
		break;
	case "firefighter":
		chrSprite = spr_chr_firefighter;
		break;
	case "explorer":
		chrSprite = spr_chr_explorer;
		break;
}
weaponLength = 16;
weaponAngle = 0;
weaponDir = 1;
warriorDir = 1;
moveDir = 0;
dashPower = 0;

isMove = false;
isDash = false;
isAction = false;

isAttackDelay = false;
isSkillDelay = false;
isDamageDelay = false;
isSwapDelay = false;
isDashDelay = false;
isReloadDelay= false;

damageSpeed = room_speed;
swapSpeed = room_speed * 0.2;
dashSpeed = room_speed;
reloadSpeed = room_speed * 0.5;

stuff = noone;

event_inherited();