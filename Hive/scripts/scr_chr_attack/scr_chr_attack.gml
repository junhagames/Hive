/// @description 캐릭터 공격

if (!isAttackDelay) {
	if (global.chrMap[? "swap"] == "ranger") {
		if (mouse_check_button(mb_left)) {
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
			else if (mouse_check_button_pressed(mb_left)) {
				// 재장전
				global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
			}
		}
	}
	else if (global.chrMap[? "swap"] == "warrior") {
		if (mouse_check_button(mb_left)) {
			var melee = instance_create_layer(x + lengthdir_x(16, weaponAngle), y + lengthdir_y(16, weaponAngle), "layer_inst", obj_melee);
			melee.image_angle = weaponAngle;
			melee.damage = global.chrMap[? "power"] + global.chrMap[? "warriorDamage"];
			isAttackDelay = true;
			alarm[ALARM_CHR.ATTACK] = global.chrMap[? "warriorSpeed"];
			
			var eft = instance_create_layer(melee.x, melee.y, "layer_particle", obj_particle_melee_swing);
			eft.image_angle = melee.image_angle;
			warriorDir *= -1;

			scr_camera_shake(10);
		}
	}
}