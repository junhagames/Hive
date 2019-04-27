/// @description 곤충 이동
/// @param target

var target = argument0;

if (instance_exists(target)) {
	var dx = (target.x div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH / 2;
	var dy = (target.y div CELL_HEIGHT) * CELL_HEIGHT + CELL_HEIGHT / 2;

	if (mp_grid_path(obj_manager_stage.enemyPathGrid, path, x, y, dx, dy, true)) {
	    path_start(path, spd, path_action_stop, false); 
	}
	
	if (x > target.x) {
		image_xscale = -1;
	}
	else {
		image_xscale = 1;
	}
}