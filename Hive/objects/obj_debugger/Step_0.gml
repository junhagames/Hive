// 무기 변경
if (keyboard_check_pressed(ord("1"))) {
	global.chrMap[? "rangerWeapon"] = "pistol";
	global.chrMap[? "rangerDamage"] = 2;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.13;
	global.chrMap[? "rangerAccuracy"] = 4;
	global.chrMap[? "ammoMax"] = 15;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];

	global.chrMap[? "warriorWeapon"] = "bat";
	global.chrMap[? "warriorDamage"] = 6;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("2"))) {
	global.chrMap[? "rangerWeapon"] = "degle";
	global.chrMap[? "rangerDamage"] = 5;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.2;
	global.chrMap[? "rangerAccuracy"] = 4;
	global.chrMap[? "ammoMax"] = 15;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	
	global.chrMap[? "warriorWeapon"] = "axe";
	global.chrMap[? "warriorDamage"] = 10;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.4;
}

if (keyboard_check_pressed(ord("3"))) {
	global.chrMap[? "rangerWeapon"] = "uzi";
	global.chrMap[? "rangerDamage"] = 2;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.08;
	global.chrMap[? "rangerAccuracy"] = 12;
	global.chrMap[? "ammoMax"] = 30;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	
	global.chrMap[? "warriorWeapon"] = "crowbar";
	global.chrMap[? "warriorDamage"] = 10;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("4"))) {
	global.chrMap[? "rangerWeapon"] = "shotgun";
	global.chrMap[? "rangerDamage"] = 10;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.3;
	global.chrMap[? "rangerAccuracy"] = 20;
	global.chrMap[? "ammoMax"] = 8;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	
	global.chrMap[? "warriorWeapon"] = "hammer";
	global.chrMap[? "warriorDamage"] = 20;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.4;
}

if (keyboard_check_pressed(ord("5"))) {
	global.chrMap[? "rangerWeapon"] = "sniper";
	global.chrMap[? "rangerDamage"] = 100;
	global.chrMap[? "rangerSpeed"] = room_speed * 0.4;
	global.chrMap[? "rangerAccuracy"] = 0;
	global.chrMap[? "ammoMax"] = 4;
	global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
	
	global.chrMap[? "warriorWeapon"] = "plunger";
	global.chrMap[? "warriorDamage"] = 3;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.1;
}

if (keyboard_check_pressed(ord("6"))) {
	global.chrMap[? "warriorWeapon"] = "knife";
	global.chrMap[? "warriorDamage"] = 15;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
}

if (keyboard_check_pressed(ord("7"))) {
	global.chrMap[? "warriorWeapon"] = "chicken";
	global.chrMap[? "warriorDamage"] = 15;
	global.chrMap[? "warriorSpeed"] = room_speed * 0.2;
}

// 모든 적 사살
if (keyboard_check_pressed(ord("P"))) {
	with (obj_parent_enemy) {
		hp = 0;
	}
}