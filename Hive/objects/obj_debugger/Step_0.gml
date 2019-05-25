// 재시작
if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}

// 무기 변경
if (keyboard_check_pressed(ord("1"))) {
	global.chrMap[? "rangerWeapon"] = "pistol";
	global.chrMap[? "ammoMax"] = 15;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	global.chrMap[? "rangerDamage"] = 2;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.13;
	global.chrMap[? "rangerAccuracy"] = 4;

	global.chrMap[? "warriorWeapon"] = "bat";
	global.chrMap[? "warriorDamage"] = 8;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("2"))) {
	global.chrMap[? "rangerWeapon"] = "degle";
	global.chrMap[? "ammoMax"] = 15;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	global.chrMap[? "rangerDamage"] = 5;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.13;
	global.chrMap[? "rangerAccuracy"] = 4;
	
	global.chrMap[? "warriorWeapon"] = "axe";
	global.chrMap[? "warriorDamage"] = 15;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("3"))) {
	global.chrMap[? "rangerWeapon"] = "uzi";
	global.chrMap[? "ammoMax"] = 30;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	global.chrMap[? "rangerDamage"] = 2;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.08;
	global.chrMap[? "rangerAccuracy"] = 12;
	
	global.chrMap[? "warriorWeapon"] = "crowbar";
	global.chrMap[? "warriorDamage"] = 10;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("4"))) {
	global.chrMap[? "rangerWeapon"] = "shotgun";
	global.chrMap[? "ammoMax"] = 8;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	global.chrMap[? "rangerDamage"] = 10;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.3;
	global.chrMap[? "rangerAccuracy"] = 20;
	
	global.chrMap[? "warriorWeapon"] = "hammer";
	global.chrMap[? "warriorDamage"] = 20;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.4;
}

if (keyboard_check_pressed(ord("5"))) {
	global.chrMap[? "rangerWeapon"] = "sniper";
	global.chrMap[? "ammoMax"] = 4;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	global.chrMap[? "rangerDamage"] = 100;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.4;
	global.chrMap[? "rangerAccuracy"] = 0;
	
	global.chrMap[? "warriorWeapon"] = "plunger";
	global.chrMap[? "warriorDamage"] = 2;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.1;
}

// 모든 적 사살
if (keyboard_check_pressed(ord("P"))) {
	with (obj_parent_enemy) {
		hp = 0;
	}
}