/// @description 월드 무작위 초기화
/// @param roomNumber

var roomNumber = argument0;

var controlX = ds_grid_width(global.worldGrid) div 2;
var controlY = ds_grid_height(global.worldGrid) div 2;
global.currentIndex = 0;

// Reset world
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		global.worldGrid[# _x, _y] = WALL;	
	}
}

// Create world
global.worldGrid[# controlX, controlY] = 0;
scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.SMALL);

for (var i = 1; i < roomNumber; i++) {
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
				var controlX1, controlY1, controlX2, controlY2;
			
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						controlX1 = controlX;
						controlY1 = controlY + choose(0, -1);
						controlX2 = controlX1 + 1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.WEST:
						controlX--;
						controlX1 = controlX;
						controlY1 = controlY + choose(0, -1);
						controlX2 = controlX1 - 1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.SOUTH:
						controlY++;
						controlX1 = controlX + choose(0, -1);
						controlY1 = controlY;
						controlX2 = controlX1 + 1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.NORTH:
						controlY--;
						controlX1 = controlX + choose(0, -1);
						controlY1 = controlY;
						controlX2 = controlX1 + 1;
						controlY2 = controlY1 - 1;
						break;
				}

				if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
					controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty) {
						ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
						scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.BIG);
						isCreateRoom = true;
					}
					else if (global.worldGrid[# controlX, controlY] == WALL) {
						controlX = previousX;
						controlY = previousY;
					}	
				}
				break;
			#endregion
			#region WLONG
			case SHAPE.WLONG:	
				var controlX1, controlY1, controlX2, controlY2;
			
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						controlX1 = controlX;
						controlY1 = controlY;
						controlX2 = controlX1 + 1;
						controlY2 = controlY1;
						break;
					case DIR.WEST:
						controlX--;
						controlX1 = controlX;
						controlY1 = controlY;
						controlX2 = controlX1 - 1;
						controlY2 = controlY1;
						break;
					case DIR.SOUTH:
						controlY++;
						controlX1 = controlX + choose(0, -1);
						controlY1 = controlY;
						controlX2 = controlX1 + 1;
						controlY2 = controlY1;
						break;
					case DIR.NORTH:
						controlY--;
						controlX1 = controlX + choose(0, -1);
						controlY1 = controlY;
						controlX2 = controlX1 + 1;
						controlY2 = controlY1;
						break;
				}

				if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
					controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty) {
						ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
						scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.WLONG);
						isCreateRoom = true;
					}
					else if (global.worldGrid[# controlX, controlY] == WALL) {
						controlX = previousX;
						controlY = previousY;
					}
				}
				break;
			#endregion
			#region HLONG
			case SHAPE.HLONG:	
				var controlX1, controlY1, controlX2, controlY2;
				
				switch (controlDir) {
					case DIR.EAST:
						controlX++;
						controlX1 = controlX;
						controlY1 = controlY + choose(0, -1);
						controlX2 = controlX1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.WEST:
						controlX--;
						controlX1 = controlX;
						controlY1 = controlY + choose(0, -1);
						controlX2 = controlX1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.SOUTH:
						controlY++;
						controlX1 = controlX;
						controlY1 = controlY;
						controlX2 = controlX1;
						controlY2 = controlY1 + 1;
						break;
					case DIR.NORTH:
						controlY--;
						controlX1 = controlX;
						controlY1 = controlY;
						controlX2 = controlX1;
						controlY2 = controlY1 - 1;
						break;
				}

				if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
					controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
					controlX = previousX;
					controlY = previousY;
				}
				else {
					var isEmpty = true;
					
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
							isEmpty = false;
							break;
						}
					}
					
					if (isEmpty) {
						ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
						scr_world_room_reset(global.worldGrid[# controlX, controlY], SHAPE.HLONG);
						isCreateRoom = true;
					}
					else if (global.worldGrid[# controlX, controlY] == WALL) {
						controlX = previousX;
						controlY = previousY;
					}
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