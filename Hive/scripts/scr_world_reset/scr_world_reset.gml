/// @description 무작위 월드 초기화
/// @param roomMax

var roomMax = argument0;

var controlX = ds_grid_width(global.worldGrid) div 2;
var controlY = ds_grid_height(global.worldGrid) div 2;

// Reset world
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		global.worldGrid[# _x, _y] = WALL;	
	}
}

// Create world
global.worldGrid[# controlX, controlY] = 0;
scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.SMALL);

for (var i = 1; i < roomMax; i++) {
	var isCreateRoom = false;
	
	do {
		var previousX = controlX;
		var previousY = controlY;
		var controlDir = choose(DIR.EAST, DIR.WEST, DIR.SOUTH, DIR.NORTH);
		var roomShape = choose(SHAPE.SMALL, SHAPE.BIG, SHAPE.WLONG, SHAPE.HLONG);

		switch (roomShape) {
			#region SMALL
			case SHAPE.SMALL:
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						break;
					case DIR.WEST:
						controlX--;
						break;
					case DIR.SOUTH:
						controlY++;
						break;
					case DIR.NORTH:
						controlY--;
						break;
				}
				
				if (controlX < 0 || controlY < 0 || controlX >= ds_grid_width(global.worldGrid) || controlY >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else if (global.worldGrid[# controlX, controlY] == WALL) {
					global.worldGrid[# controlX, controlY] = i;
					scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.SMALL);
					isCreateRoom = true;
				}
				break;
			#endregion
			#region BIG
			case SHAPE.BIG:	
				var _controlX1, _controlY1, _controlX2, _controlY2;
			
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						_controlX1 = controlX;
						_controlY1 = controlY + choose(0, -1);
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.WEST:
						controlX--;
						_controlX1 = controlX;
						_controlY1 = controlY + choose(0, -1);
						_controlX2 = _controlX1 - 1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.SOUTH:
						controlY++;
						_controlX1 = controlX + choose(0, -1);
						_controlY1 = controlY;
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.NORTH:
						controlY--;
						_controlX1 = controlX + choose(0, -1);
						_controlY1 = controlY;
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1 - 1;
						break;
				}

				if (_controlX1 < 0 || _controlY1 < 0 || _controlX1 >= ds_grid_width(global.worldGrid) || _controlY1 >= ds_grid_height(global.worldGrid) ||
					_controlX2 < 0 || _controlY2 < 0 || _controlX2 >= ds_grid_width(global.worldGrid) || _controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (!isEmpty) {
						if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, i);
					scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.BIG);
					isCreateRoom = true;
				}
				break;
			#endregion
			#region WLONG
			case SHAPE.WLONG:	
				var _controlX1, _controlY1, _controlX2, _controlY2;
			
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						_controlX1 = controlX;
						_controlY1 = controlY;
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1;
						break;
					case DIR.WEST:
						controlX--;
						_controlX1 = controlX;
						_controlY1 = controlY;
						_controlX2 = _controlX1 - 1;
						_controlY2 = _controlY1;
						break;
					case DIR.SOUTH:
						controlY++;
						_controlX1 = controlX + choose(0, -1);
						_controlY1 = controlY;
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1;
						break;
					case DIR.NORTH:
						controlY--;
						_controlX1 = controlX + choose(0, -1);
						_controlY1 = controlY;
						_controlX2 = _controlX1 + 1;
						_controlY2 = _controlY1;
						break;
				}

				if (_controlX1 < 0 || _controlY1 < 0 || _controlX1 >= ds_grid_width(global.worldGrid) || _controlY1 >= ds_grid_height(global.worldGrid) ||
					_controlX2 < 0 || _controlY2 < 0 || _controlX2 >= ds_grid_width(global.worldGrid) || _controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (!isEmpty) {
						if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, i);
					scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.WLONG);
					isCreateRoom = true;
				}
				break;
			#endregion
			#region HLONG
			case SHAPE.HLONG:	
				var _controlX1, _controlY1, _controlX2, _controlY2;
			
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						_controlX1 = controlX;
						_controlY1 = controlY + choose(0, -1);
						_controlX2 = _controlX1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.WEST:
						controlX--;
						_controlX1 = controlX;
						_controlY1 = controlY + choose(0, -1);
						_controlX2 = _controlX1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.SOUTH:
						controlY++;
						_controlX1 = controlX;
						_controlY1 = controlY;
						_controlX2 = _controlX1;
						_controlY2 = _controlY1 + 1;
						break;
					case DIR.NORTH:
						controlY--;
						_controlX1 = controlX;
						_controlY1 = controlY;
						_controlX2 = _controlX1;
						_controlY2 = _controlY1 - 1;
						break;
				}

				if (_controlX1 < 0 || _controlY1 < 0 || _controlX1 >= ds_grid_width(global.worldGrid) || _controlY1 >= ds_grid_height(global.worldGrid) ||
					_controlX2 < 0 || _controlY2 < 0 || _controlX2 >= ds_grid_width(global.worldGrid) || _controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (!isEmpty) {
						if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}
						break;	
					}
					ds_grid_set_region(global.worldGrid, _controlX1, _controlY1, _controlX2, _controlY2, i);
					scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.HLONG);
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
			scr_world_room_entry(global.worldGrid[# _x, _y], _x, _y);	
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