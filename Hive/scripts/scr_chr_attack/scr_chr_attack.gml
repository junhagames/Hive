/// @description 캐릭터 공격

if (!isAttackDelay) {
	if (global.chrStatus[? "swap"] == SWAP.RANGER) {
		if (mouse_check_button(mb_left)) {
			if (global.chrStatus[? "rangerAmmo"] > 0) {
				var bullet = instance_create_depth(x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, 0, obj_bullet1);
				bullet.direction = weaponAngle + random_range(-global.chrStatus[? "rangerAccuracy"], global.chrStatus[? "rangerAccuracy"]);
				bullet.image_angle = bullet.direction;
				bullet.speed = 18;
				bullet.damage = global.chrStatus[? "strength"] + global.chrStatus[? "rangerDamage"];
				global.chrStatus[? "rangerAmmo"]--;
				isAttackDelay = true;
				alarm[0] = global.chrStatus[? "rangerSpeed"];
			}
		}
	}
	else {
		if (mouse_check_button(mb_left)) {
			var melee = instance_create_depth(x + lengthdir_x(64, weaponAngle), y + lengthdir_y(64, weaponAngle), 0, obj_melee1);
			melee.image_angle = weaponAngle;
			melee.damage = global.chrStatus[? "strength"] + global.chrStatus[? "warriorDamage"];
			isAttackDelay = true;
			alarm[0] = global.chrStatus[? "warriorSpeed"];
			
			var eft = instance_create_depth(melee.x, melee.y, 0, obj_eft_melee1);
			eft.image_angle = melee.image_angle;
		}
	}
}