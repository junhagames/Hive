/// @description 곤충 이동

if (instance_exists(obj_chr)) {
	var dx = (obj_chr.x div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH / 2;
	var dy = (obj_chr.y div CELL_HEIGHT) * CELL_HEIGHT + CELL_HEIGHT / 2;

	if (mp_grid_path(obj_system_stage.enemyGrid, path, x, y, dx, dy, 1)) {
	    path_start(path, _speed, path_action_stop, false); 
	}
}