scr_init_game();

var wsize = 5;
var hsize = 5;
var _x = wsize div 2;
var _y = hsize div 2;
map = ds_grid_create(wsize, hsize);
mapList = ds_list_create();

// reset
for (var i = 0; i < wsize; i++) {
	for (var j = 0; j < hsize; j++) {
		map[# i, j] = "#";	
	}
}

// Set
map[# _x, _y] = 0;

for (var i = 1; i < 5; i++) {
	var out = false;
	
	do {
		var xx = _x;
		var yy = _y;
		var dir = choose(DIR.EAST, DIR.WEST, DIR.SOUTH, DIR.NORTH);
		var shape = choose(/*SHAPE.SMALL,*/ SHAPE.BIG)//, SHAPE.WLONG, SHAPE.HLONG);
		
		switch (shape) {
			#region SMALL
			case SHAPE.SMALL:
				switch (dir) {
					case DIR.EAST:
						_x++;
						break;
					case DIR.WEST:
						_x--;
						break;
					case DIR.SOUTH:
						_y++;
						break;
					case DIR.NORTH:
						_y--;
						break;
				}
				
				if (_x < 0 || _y < 0 || _x >= wsize || _y >= hsize) {
					_x = xx;
					_y = yy;
				}
				else if (map[# _x, _y] == "#") {
					map[# _x, _y] = i;
					out = true;
				}
				break;
			#endregion
			#region BIG
			case SHAPE.BIG:
				var col_x, col_y, _col_x, _col_y;
			
				switch (dir) {
					case DIR.EAST:
						_x++;
						col_x = _x;
						col_y = _y + choose(0, -1);
						_col_x = col_x + 1;
						_col_y = col_y + 1;
						break;
					case DIR.WEST:
						_x--;
						col_x = _x;
						col_y = _y + choose(0, -1);
						_col_x = col_x - 1;
						_col_y = col_y + 1;
						break;
					case DIR.SOUTH:
						_y++;
						col_x = _x + choose(0, -1);
						col_y = _y;
						_col_x = col_x + 1;
						_col_y = col_y + 1;
						break;
					case DIR.NORTH:
						_y--;
						col_x = _x + choose(0, -1);
						col_y = _y;
						_col_x = col_x + 1;
						_col_y = col_y - 1;
						break;
				}

				if (col_x < 0 || col_y < 0 || col_x >= wsize || col_y >= hsize ||
					_col_x < 0 || _col_y < 0 || _col_x >= wsize || _col_y >= hsize) {
					_x = xx;
					_y = yy;
				}
				else {
					var empty = true;
					for (var j = 0; j < i; j++) {
						if (ds_grid_value_exists(map, col_x, col_y, _col_x, _col_y, j)) {
							empty = false;
							break;
						}
					}
					if (!empty) {
						break;	
					}
					ds_grid_set_region(map, col_x, col_y, _col_x, _col_y, i);
					out = true;
				}
				break;
			#endregion
		}
	}
	until (out);
}

// Print
for (var i = 0; i < wsize; i++) {
	var text = "";
	for (var j = 0; j < hsize; j++) {
		text += string(map[# i, j]);	
	}
	show_debug_message(text);
}
show_debug_message("===============");

ds_grid_destroy(map);
ds_list_destroy(mapList);