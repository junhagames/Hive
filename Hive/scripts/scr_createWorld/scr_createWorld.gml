/// @description 무작위 월드 생성
/// @param roomMax

var roomMax = argument0;

var control_x = ds_grid_width(global.worldGrid) div 2;
var control_y = ds_grid_height(global.worldGrid) div 2;

// Reset world
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		global.worldGrid[# _x, _y] = WALL;	
	}
}

// Create world
global.worldGrid[# control_x, control_y] = 0;
scr_world_createRoom(global.worldGrid[# control_x, control_y], SHAPE.SMALL);

for (var i = 1; i < roomMax; i++) {
	var isCreateRoom = false;
	
	do {
		var previous_x = control_x;
		var previous_y = control_y;
		var control_dir = choose(DIR.EAST, DIR.WEST, DIR.SOUTH, DIR.NORTH);
		var roomShape = choose(SHAPE.SMALL, SHAPE.BIG, SHAPE.WLONG, SHAPE.HLONG);

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
				
				if (control_x < 0 || control_y < 0 || control_x >= ds_grid_width(global.worldGrid) || control_y >= ds_grid_height(global.worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else if (global.worldGrid[# control_x, control_y] == WALL) {
					global.worldGrid[# control_x, control_y] = i;
					scr_world_createRoom(global.worldGrid[# control_x, control_y], SHAPE.SMALL);
					isCreateRoom = true;
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

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(global.worldGrid) || _control1_y >= ds_grid_height(global.worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(global.worldGrid) || _control2_y >= ds_grid_height(global.worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (global.worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					scr_world_createRoom(global.worldGrid[# control_x, control_y], SHAPE.BIG);
					isCreateRoom = true;
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

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(global.worldGrid) || _control1_y >= ds_grid_height(global.worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(global.worldGrid) || _control2_y >= ds_grid_height(global.worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (global.worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					scr_world_createRoom(global.worldGrid[# control_x, control_y], SHAPE.WLONG);
					isCreateRoom = true;
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

				if (_control1_x < 0 || _control1_y < 0 || _control1_x >= ds_grid_width(global.worldGrid) || _control1_y >= ds_grid_height(global.worldGrid) ||
					_control2_x < 0 || _control2_y < 0 || _control2_x >= ds_grid_width(global.worldGrid) || _control2_y >= ds_grid_height(global.worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty == false) {
						if (global.worldGrid[# control_x, control_y] == WALL) {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					scr_world_createRoom(global.worldGrid[# control_x, control_y], SHAPE.HLONG);
					isCreateRoom = true;
				}
				break;
			#endregion
		}
	}
	until (isCreateRoom);
}

// Create room entry
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] != WALL) {
			scr_world_room_createEntry(global.worldGrid[# _x, _y], _x, _y);	
		}
	}
}

// Print
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	var text = "";
	
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] == WALL) {
			text += " ";
		}
		else {
			text += string(global.worldGrid[# _x, _y]);	
		}
	}
	show_debug_message(text);
}

var line = "";

for (var i = 0; i < ds_grid_width(global.worldGrid); i++) {
	line += "+";
}
show_debug_message(line);