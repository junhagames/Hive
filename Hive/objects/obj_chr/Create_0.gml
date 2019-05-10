weaponSprite = spr_weapon_pistol;
weaponLength = 16;
weaponAngle = 0;
weaponDir = 1;

isMove = false;
isAttackDelay = false;
isSkillDelay = false;
isDamageDelay = false;
isSwapDelay = false;
isSwapSkillDelay = false;

skillSpeed = room_speed * 10;
swapSpeed = room_speed * 0.2;
swapSkillSpeed = room_speed * 5;

global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];