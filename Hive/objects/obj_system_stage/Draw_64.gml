draw_set_alpha(0.6);

#region Minimap
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
draw_text_ext(1000, 10, text, 18, 1000);
draw_set_color(c_white);
#endregion
#region HP
draw_sprite_ext(spr_ui_hp, 0, 80, 60, 1, 1, 0, c_white, draw_get_alpha());
draw_set_color(c_fuchsia);
draw_rectangle(120, 40, 120 + global.chrStatus[? "hp"] / global.chrStatus[? "hpMax"] * 280, 80, false);
draw_set_color(c_white);
draw_rectangle(120, 40, 400, 80, true);
#endregion
#region Ammo
draw_sprite_ext(spr_ui_ammo, 0, 80, 140, 1, 1, 0, c_white, draw_get_alpha());
draw_set_color(c_yellow);
draw_rectangle(120, 120, 120 + global.chrStatus[? "rangerAmmo"] / global.chrStatus[? "rangerAmmoMax"] * 280, 160, false);
draw_set_color(c_white);
draw_rectangle(120, 120, 400, 160, true);
#endregion

draw_set_alpha(1);