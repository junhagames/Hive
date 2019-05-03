weaponSprite = spr_weapon_pistol;
weaponLength = 16;
weaponAngle = 0;
weaponDir = 1;

isMove = false;
isAttackDelay = false;
isSkillDelay = false;
isDamageDelay = false;
isSwapDelay = false;

skillSpeed = room_speed * 10;
swapSpeed = room_speed;

global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];