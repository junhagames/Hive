// Draw Minimap
var text = "";

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (index == WALL) {
			text += "□";
			continue;
		}

		var worldIndex = global.worldList[| index];
		var infoMap = worldIndex[| MARK.INFO];
		
		if (index == global.currentIndex) {
			text += "@";
		}
		else {
			switch (infoMap[? "search"]) {
				case SEARCH.UNKNOWN:
					text += "□";
					break;
				case SEARCH.CLOSE:
					text += "▣";
					break;
				case SEARCH.KNOWN:
					text += "■";
					break;
			}
		}	
	}
	text += "\n";
}

draw_set_color(c_lime);
draw_text(1000, 10, text);
draw_set_color(c_white);