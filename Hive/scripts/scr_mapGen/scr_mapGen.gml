/// @description 무작위 방 생성
/// @param roomMax

var roomMax = argument0;
worldGrid = ds_grid_create(15, 15);
worldList = ds_list_create();

var control_x = ds_grid_width(worldGrid) div 2;
var control_y = ds_grid_height(worldGrid) div 2;

// Reset world
for (var i = 0; i < ds_grid_height(worldGrid); i++) {
	for (var j = 0; j < ds_grid_width(worldGrid); j++) {
		worldGrid[# i, j] = "#";	
	}
}

// Set room
worldGrid[# control_x, control_y] = 0;
ds_list_add(worldList, ds_list_create());
ds_list_mark_as_list(worldList, 0);
var infoList = worldList[| 0];
infoList[| MARK.ENTRY] = ds_list_create();
infoList[| MARK.OBJECT] = ds_map_create();
ds_list_mark_as_list(infoList, MARK.ENTRY);
ds_list_mark_as_map(infoList, MARK.OBJECT);

var entryRoomList = infoList[| MARK.ENTRY];
var objectMap = infoList[| MARK.OBJECT];

for (var i = 1; i < roomMax; i++) {
	var isGenRoom = false;
	
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
				
				if (control_x < 0 || control_y < 0 || control_x >= ds_grid_width(worldGrid) || control_y >= ds_grid_height(worldGrid)) {
					control_x = previous_x;
					control_y = previous_y;
				}
				else if (worldGrid[# control_x, control_y] == "#") {
					worldGrid[# control_x, control_y] = i;
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
						if (worldGrid[# control_x, control_y] == "#") {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
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
						if (worldGrid[# control_x, control_y] == "#") {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
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
						if (worldGrid[# control_x, control_y] == "#") {
							control_x = previous_x;
							control_y = previous_y;
						}
						break;	
					}
					ds_grid_set_region(worldGrid, _control1_x, _control1_y, _control2_x, _control2_y, i);
					isGenRoom = true;
				}
				break;
			#endregion
		}
	}
	until (isGenRoom);
}

// Print
for (var i = 0; i < ds_grid_height(worldGrid); i++) {
	var text = "";
	for (var j = 0; j < ds_grid_width(worldGrid); j++) {
		text += string(worldGrid[# j, i]);	
	}
	show_debug_message(text);
}

repeat(3) {
	show_debug_message("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
}

ds_grid_destroy(worldGrid);
ds_list_destroy(worldList);