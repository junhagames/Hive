/// @description 무작위 월드 생성
/// @param roomMax

var roomMax = argument0;

worldGrid = ds_grid_create(15, 15);
worldList = ds_list_create();
var control_x = ds_grid_width(worldGrid) div 2;
var control_y = ds_grid_height(worldGrid) div 2;

// Reset world
for (var _y = 0; _y < ds_grid_height(worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(worldGrid); _x++) {
		worldGrid[# _x, _y] = WALL;	
	}
}

// Create world
worldGrid[# control_x, control_y] = 0;
scr_world_roomReset(worldGrid[# control_x, control_y], SHAPE.SMALL);

for (var i = 1; i < roomMax; i++) {
	var isGenRoom = false;
	
	do {
		var previous_x = control_x;
		var previous_y = control_y;
		var control_dir = choose(DIR.EAST, DIR.WEST, DIR.SOUTH, DIR.NORTH);
		var roomShape = choose(SHAPE.SMALL)//, SHAPE.BIG, SHAPE.WLONG, SHAPE.HLONG);

		switch (roomShape) {
			#region SMALL
			case SHAPE.SMALL:
				switch (control_dir) {
					case DIR.EAST:
						control_x++;
						break;
					case DIR.WEST:
						control_x--;
						break;
					case DIR.SOUTH:
						control_y++;
						break;
					case DIR.NORTH:
						control_y--;
						break;
				}
				
				if (control_x < 0 || control_y < 0 || control_x >= ds_grid_width(worldGrid) || control_y >= ds_grid_height(worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else if (worldGrid[# control_x, control_y] == WALL) {
					worldGrid[# control_x, control_y] = i;
					scr_world_roomReset(worldGrid[# control_x, control_y], SHAPE.SMALL);
					isGenRoom = true;
				}
				break;
			#endregion
			#region BIG
			case SHAPE.BIG:	
				var _control1_x, _control1_y, _control2_x, _control2_y;
			
				switch (control_dir) {
					case DIR.EAST:
						control_x++;
						_control1_x = control_x;
						_control1_y = control_y + choose(0, -1);
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y + 1;
						break;
					case DIR.WEST:
						control_x--;
						_control1_x = control_x;
						_control1_y = control_y + choose(0, -1);
						_control2_x = _control1_x - 1;
						_control2_y = _control1_y + 1;
						break;
					case DIR.SOUTH:
						control_y++;
						_control1_x = control_x + choose(0, -1);
						_control1_y = control_y;
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y + 1;
						break;
					case DIR.NORTH:
						control_y--;
						_control1_x = control_x + choose(0, -1);
						_control1_y = control_y;
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y - 1;
						break;
				}

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(worldGrid) || _control1_y >= ds_grid_height(worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(worldGrid) || _control2_y >= ds_grid_height(worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					var sx, dx, sy, dy;
					
					if (_control1_x < _control2_x) {
						sx = _control1_x;
						dx = _control2_x;
					}
					else {
						sx = _control2_x;
						dx = _control1_x;
					}
					
					if (_control1_y < _control2_y) {
						sy = _control1_y;
						dy = _control2_y;
					}
					else {
						sy = _control2_y;
						dy = _control1_y;
					}

					for (var _y = sy; _y <= dy; _y++) {
						for (var _x = sx; _x <= dx; _x++) {
							scr_world_roomReset(worldGrid[# _x, _y], SHAPE.BIG);
						}
					}
					isGenRoom = true;
				}
				break;
			#endregion
			#region WLONG
			case SHAPE.WLONG:	
				var _control1_x, _control1_y, _control2_x, _control2_y;
			
				switch (control_dir) {
					case DIR.EAST:
						control_x++;
						_control1_x = control_x;
						_control1_y = control_y;
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y;
						break;
					case DIR.WEST:
						control_x--;
						_control1_x = control_x;
						_control1_y = control_y;
						_control2_x = _control1_x - 1;
						_control2_y = _control1_y;
						break;
					case DIR.SOUTH:
						control_y++;
						_control1_x = control_x + choose(0, -1);
						_control1_y = control_y;
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y;
						break;
					case DIR.NORTH:
						control_y--;
						_control1_x = control_x + choose(0, -1);
						_control1_y = control_y;
						_control2_x = _control1_x + 1;
						_control2_y = _control1_y;
						break;
				}

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(worldGrid) || _control1_y >= ds_grid_height(worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(worldGrid) || _control2_y >= ds_grid_height(worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					var sx, dx, sy, dy;
					
					if (_control1_x < _control2_x) {
						sx = _control1_x;
						dx = _control2_x;
					}
					else {
						sx = _control2_x;
						dx = _control1_x;
					}
					
					if (_control1_y < _control2_y) {
						sy = _control1_y;
						dy = _control2_y;
					}
					else {
						sy = _control2_y;
						dy = _control1_y;
					}

					for (var _y = sy; _y <= dy; _y++) {
						for (var _x = sx; _x <= dx; _x++) {
							scr_world_roomReset(worldGrid[# _x, _y], SHAPE.WLONG);
						}
					}
					isGenRoom = true;
				}
				break;
			#endregion
			#region HLONG
			case SHAPE.HLONG:	
				var _control1_x, _control1_y, _control2_x, _control2_y;
			
				switch (control_dir) {
					case DIR.EAST:
						control_x++;
						_control1_x = control_x;
						_control1_y = control_y + choose(0, -1);
						_control2_x = _control1_x;
						_control2_y = _control1_y + 1;
						break;
					case DIR.WEST:
						control_x--;
						_control1_x = control_x;
						_control1_y = control_y + choose(0, -1);
						_control2_x = _control1_x;
						_control2_y = _control1_y + 1;
						break;
					case DIR.SOUTH:
						control_y++;
						_control1_x = control_x;
						_control1_y = control_y;
						_control2_x = _control1_x;
						_control2_y = _control1_y + 1;
						break;
					case DIR.NORTH:
						control_y--;
						_control1_x = control_x;
						_control1_y = control_y;
						_control2_x = _control1_x;
						_control2_y = _control1_y - 1;
						break;
				}

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(worldGrid) || _control1_y >= ds_grid_height(worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(worldGrid) || _control2_y >= ds_grid_height(worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					var sx, dx, sy, dy;
					
					if (_control1_x < _control2_x) {
						sx = _control1_x;
						dx = _control2_x;
					}
					else {
						sx = _control2_x;
						dx = _control1_x;
					}
					
					if (_control1_y < _control2_y) {
						sy = _control1_y;
						dy = _control2_y;
					}
					else {
						sy = _control2_y;
						dy = _control1_y;
					}

					for (var _y = sy; _y <= dy; _y++) {
						for (var _x = sx; _x <= dx; _x++) {
							scr_world_roomReset(worldGrid[# _x, _y], SHAPE.HLONG);
						}
					}
					isGenRoom = true;
				}
				break;
			#endregion
		}
	}
	until (isGenRoom);
}

// Add room
for (var _y = 0; _y < ds_grid_height(worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(worldGrid); _x++) {
		if (worldGrid[# _x, _y] != WALL) {
			scr_world_roomAdd(worldGrid[# _x, _y], _x, _y);	
		}
	}
}

#region Print
for (var _y = 0; _y < ds_grid_height(worldGrid); _y++) {
	var text = "";
	
	for (var _x = 0; _x < ds_grid_width(worldGrid); _x++) {
		if (worldGrid[# _x, _y] == WALL) {
			text += " ";
		}
		else {
			text += string(worldGrid[# _x, _y]);	
		}
	}
	show_debug_message(text);
}

repeat(3) {
	show_debug_message("+++++++++++++++++++++++++++");
}
#endregion

ds_grid_destroy(worldGrid);
ds_list_destroy(worldList);