/// @description 캐릭터 공격

if (!isAttackDelay) {
	if (global.chrStatus[? "swap"] == SWAP.RANGER) {
		if (mouse_check_button(mb_left)) {
			if (global.chrStatus[? "ammo"] > 0) {
				var bullet = instance_create_layer(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, "layer_inst", obj_bullet1);
				bullet.direction = weaponAngle + random_range(-global.chrStatus[? "rangerAccuracy"], global.chrStatus[? "rangerAccuracy"]);
				bullet.image_angle = bullet.direction;
				bullet.speed = 20;
				bullet.damage = global.chrStatus[? "strength"] + global.chrStatus[? "rangerDamage"];
				global.chrStatus[? "ammo"]--;
				isAttackDelay = true;
				alarm[ALARM_CHR.ATTACK] = global.chrStatus[? "rangerSpeed"];
			}
		}
	}
	else {
		if (mouse_check_button(mb_left)) {
			var melee = instance_create_layer(x + lengthdir_x(64, weaponAngle), y + lengthdir_y(64, weaponAngle), "layer_inst", obj_melee1);
			melee.image_angle = weaponAngle;
			melee.damage = global.chrStatus[? "strength"] + global.chrStatus[? "warriorDamage"];
			isAttackDelay = true;
			alarm[ALARM_CHR.ATTACK] = global.chrStatus[? "warriorSpeed"];
			
			var eft = instance_create_layer(melee.x, melee.y, "layer_particle", obj_particle_melee1);
			eft.image_angle = melee.image_angle;
		}
	}
}