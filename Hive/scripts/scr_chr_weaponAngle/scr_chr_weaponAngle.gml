/// @description 캐릭터 무기 각도|방향 설정

if (os_type == os_windows) {
	weaponAngle = point_direction(x, y, mouse_x, mouse_y);
}
else if (os_type == os_android) {
	if (global.vkey[VKEY.ATTACK, VKEY_SETTING.CHECK]) {
		var enemy = noone;
	
		for (var i = 1; i <= instance_number(obj_parent_enemy); i++) {
			enemy = scr_instance_nth_nearest(x, y, obj_parent_enemy, i);
		
			if (collision_line(x, y, enemy.x, enemy.y, obj_parent_solid, false, false) != noone) {
				enemy = noone;
			}
			else {
				break;
			}
		}
		
		if (enemy != noone) {
			weaponAngle = point_direction(x, y, enemy.x, enemy.y);
		}
		else {
			weaponAngle = global.vstick[VSTICK.MOVE, VSTICK_SETTING.DIRECTION];
		}
	}
	else {
		weaponAngle = global.vstick[VSTICK.MOVE, VSTICK_SETTING.DIRECTION];
	}
}

if (weaponAngle > 90 && weaponAngle < 270) {
	weaponDir = -1;
}
else {
	weaponDir = 1;
}