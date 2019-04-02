// Draw Minimap
var text = "";

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] == WALL) {
			text += "□";
		}
		else {
			if (global.worldGrid[# _x, _y] == global.currentIndex) {
				text += "@";
			}
			else {
				text += "■";
			}
		}
	}
	text += "\n";
}

draw_set_color(c_lime);
draw_text(1000, 10, text);
draw_set_color(c_white);