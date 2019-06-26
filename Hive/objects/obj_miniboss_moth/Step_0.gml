if (instance_exists(target)) {
	var dx = (target.x div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH / 2;
	var dy = (target.y div CELL_HEIGHT) * CELL_HEIGHT + CELL_HEIGHT / 2;
}

switch (state) {
	#region Idle
	case ENEMY_STATE.IDLE:
		counter++;
		
		if (counter >= room_speed * 2) {
			var change = choose(0, 1);
			
			if (change == 0) {
				state = ENEMY_STATE.WANDER;
			}
			counter = 0;
		}
		
		if (instance_exists(target)) {
			if (distance_to_object(target) < alertDistance && mp_grid_path(obj_game.enemyPathGrid, path, x, y, dx, dy, true)) {
				state = ENEMY_STATE.ALERT;
			}
		}
		break;
	#endregion
	#region Wander
	case ENEMY_STATE.WANDER:
		counter++;
		
		if (counter >= room_speed * 2) {
			var change = choose(0, 1);
			
			if (change == 0) {
				state = ENEMY_STATE.IDLE;
			}
			dir = random(360);
			moveX = moveSpeed * choose(-1, 1) / 2;
			moveY = moveSpeed * choose(-1, 1) / 2;
			counter = 0;
		}
		var _moveX = lengthdir_x(abs(moveX), dir);
		var _moveY = lengthdir_y(abs(moveY), dir);

		if (place_meeting(x + _moveX, y, obj_parent_solid) || 
			place_meeting(x, y + _moveY, obj_parent_solid)) {
			dir = (dir + 180) mod 360;
		}
		x += lengthdir_x(abs(moveX), dir);
		y += lengthdir_y(abs(moveY), dir);
		image_xscale = dir > 90 && dir < 270 ? -1 : 1;

		if (instance_exists(target)) {
			if (distance_to_object(target) < alertDistance && mp_grid_path(obj_game.enemyPathGrid, path, x, y, dx, dy, true)) {
				state = ENEMY_STATE.ALERT;
			}
		}
		break;
	#endregion
	#region Alert
		case ENEMY_STATE.ALERT:
			if (instance_exists(target)) {
				if (mp_grid_path(obj_game.enemyPathGrid, path, x, y, dx, dy, true)) {
				    path_start(path, moveSpeed, path_action_stop, false);
					image_xscale = direction > 90 && direction < 270 ? -1 : 1;
				}
			}
			break;
	#endregion
}

event_inherited();