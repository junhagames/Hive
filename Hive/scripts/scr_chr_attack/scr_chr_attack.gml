/// @description 캐릭터 공격|재장전

// 캐릭터 공격
if (!isAttackDelay && !isAction) {
	if (((os_type == os_windows && mouse_check_button_pressed(mb_left)) ||
		(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.PRESSED])) && stuff != noone) {
		isAction = true;
	}
	else {
		if (global.chrMap[? "swap"] == "ranger") {
			if ((os_type == os_windows && mouse_check_button(mb_left)) ||
				(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.CHECK])) {
				if (global.chrMap[? "ammo"] > 0) {
					var bulletObj, bulletNum;
			
					switch (global.chrMap[? "rangerWeapon"]) {
						case "pistol":
							bulletObj = obj_bullet1;
							bulletNum = 1;
							break;
						case "deagle":
							bulletObj = obj_bullet1;
							bulletNum = 1;
							break;
						case "uzi":
							bulletObj = obj_bullet1;
							bulletNum = 1;
							break;
						case "shotgun":
							bulletObj = obj_bullet2;
							bulletNum = 5;
							break;
						case "sniper":
							bulletObj = obj_bullet3;
							bulletNum = 1;
							break;
					}
			
					repeat(bulletNum) {
						var bullet = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 16, "layer_inst", bulletObj);
						bullet.direction = weaponAngle + random_range(-global.chrMap[? "rangerAccuracy"], global.chrMap[? "rangerAccuracy"]);
						bullet.image_angle = bullet.direction;
						bullet.damage = global.chrMap[? "power"] + global.chrMap[? "rangerDamage"];
					}
					global.chrMap[? "ammo"]--;
					isAttackDelay = true;
					alarm[ALARM_CHR.ATTACK] = global.chrMap[? "rangerSpeed"];
					scr_vfx_bullet(spr_vfx_bullet_shell);
					scr_camera_shake(4);
					audio_play_sound(sfx_ranger_attack1, 10, false);
				}
			}
		}
		else if (global.chrMap[? "swap"] == "warrior") {
			if ((os_type == os_windows && mouse_check_button(mb_left)) ||
				(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.CHECK])) {
				var meleeObj;
				
				switch (global.chrMap[? "warriorWeapon"]) {
					case "bat":
						meleeObj = obj_melee1;
						break;
					case "axe":
						meleeObj = obj_melee1;
						break;
					case "crowbar":
						meleeObj = obj_melee1;
						break;
					case "hammer":
						meleeObj = obj_melee1;
						break;
					case "plunger":
						meleeObj = obj_melee1;
						break;
					case "knife":
						meleeObj = obj_melee1;
						break;
					case "chicken":
						meleeObj = obj_melee1;
						break;
				}
				
				var melee = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 16, "layer_inst", meleeObj);
				melee.image_angle = weaponAngle;
				melee.damage = global.chrMap[? "power"] + global.chrMap[? "warriorDamage"];
				isAttackDelay = true;
				warriorDir *= -1;
				alarm[ALARM_CHR.ATTACK] = global.chrMap[? "warriorSpeed"];
				scr_vfx_melee_swing(melee.x, melee.y, melee.image_angle);
				scr_camera_shake(4);
				audio_play_sound(sfx_warrior_attack1, 10, false);
			}
		}
	}
}

// 캐릭터 재장전
if (global.chrMap[? "ammo"] == 0 && !isReloadDelay) {
	isReloadDelay = true;
	alarm[ALARM_CHR.RELOAD] = reloadSpeed;
	scr_vfx_bullet(spr_vfx_bullet_magazine);
}

// 상호작용 초기화
if ((os_type == os_windows && mouse_check_button_released(mb_left)) ||
	(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.RELEASED])) {
	isAction = false;
}