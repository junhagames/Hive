/// @description 캐릭터 공격

// 재장전
if (global.chrMap[? "swap"] == "ranger") {
	if (os_type == os_windows && mouse_check_button_released(mb_left) || os_type == os_android && global.vstick[VSTICK.ATTACK, VSTICK_SETTING.RELEASED]) {
		if (global.chrMap[? "ammo"] == 0) {
			global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
		}
	}
}

if (!isAttackDelay) {
	if (global.chrMap[? "swap"] == "ranger") {
		if ((os_type == os_windows && mouse_check_button(mb_left)) || (os_type == os_android && global.vstick[VSTICK.ATTACK, VSTICK_SETTING.CHECK])) {
			if (global.chrMap[? "ammo"] > 0) {
				var bullet = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, "layer_inst", obj_bullet);
				bullet.direction = weaponAngle + random_range(-global.chrMap[? "rangerAccuracy"], global.chrMap[? "rangerAccuracy"]);
				bullet.image_angle = bullet.direction;
				bullet.speed = 18;
				bullet.damage = global.chrMap[? "power"] + global.chrMap[? "rangerDamage"];
				global.chrMap[? "ammo"]--;
				isAttackDelay = true;
				alarm[ALARM_CHR.ATTACK] = global.chrMap[? "rangerSpeed"];
				
				scr_camera_shake(4);
			}
		}
	}
	else if (global.chrMap[? "swap"] == "warrior") {
		if ((os_type == os_windows && mouse_check_button(mb_left)) || (os_type == os_android && global.vstick[VSTICK.ATTACK, VSTICK_SETTING.CHECK])) {
			var melee = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle), "layer_inst", obj_melee);
			melee.image_angle = weaponAngle;
			melee.damage = global.chrMap[? "power"] + global.chrMap[? "warriorDamage"];
			isAttackDelay = true;
			alarm[ALARM_CHR.ATTACK] = global.chrMap[? "warriorSpeed"];
			
			var particle = instance_create_layer(melee.x, melee.y, "layer_particle", obj_particle_melee_swing);
			particle.image_angle = melee.image_angle;
			warriorDir *= -1;

			scr_camera_shake(10);
		}
	}
}