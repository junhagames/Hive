/// @description 캐릭터 공격

if (!isAttackDelay) {
	if (global.chrMap[? "swap"] == SWAP.RANGER) {
		if (mouse_check_button(mb_left)) {
			if (global.chrMap[? "ammo"] > 0) {
				var bullet = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, "layer_inst", obj_bullet1);
				bullet.direction = weaponAngle + random_range(-global.chrMap[? "rangerAccuracy"], global.chrMap[? "rangerAccuracy"]);
				bullet.image_angle = bullet.direction;
				bullet.speed = 18;
				bullet.damage = global.chrMap[? "strength"] + global.chrMap[? "rangerDamage"];
				global.chrMap[? "ammo"]--;
				isAttackDelay = true;
				alarm[ALARM_CHR.ATTACK] = global.chrMap[? "rangerSpeed"];
			}
		}
	}
	else if (global.chrMap[? "swap"] == SWAP.WARRIOR) {
		if (mouse_check_button(mb_left)) {
			var melee = instance_create_layer(x + lengthdir_x(16, weaponAngle), y + lengthdir_y(16, weaponAngle), "layer_inst", obj_melee1);
			melee.image_angle = weaponAngle;
			melee.damage = global.chrMap[? "strength"] + global.chrMap[? "warriorDamage"];
			isAttackDelay = true;
			alarm[ALARM_CHR.ATTACK] = global.chrMap[? "warriorSpeed"];
			
			var eft = instance_create_layer(melee.x, melee.y, "layer_particle", obj_particle_melee1);
			eft.image_angle = melee.image_angle;
		}
	}
}