draw_set_alpha(0.6);
#region Minimap
var text = "";

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (index == WALL) {
			text += "□";
		}
		else if (index == global.currentIndex) {
			text += "@";
		}
		else {
			var worldIndex = global.worldList[| index];
			var infoMap = worldIndex[| MARK.INFO];
		
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
draw_text_ext(1000, 140, text, 18, 1000);
draw_set_color(c_white);
#endregion
#region HP
draw_set_color(c_fuchsia);
draw_rectangle(40, 40, 40 + global.chrStatus[? "hp"] / global.chrStatus[? "hpMax"] * 300, 80, false);
draw_set_color(c_white);
draw_rectangle(40, 40, 340, 80, true);
#endregion
#region Money
draw_sprite_ext(spr_ui_money, 0, 40, 120, 1, 1, 0, c_white, draw_get_alpha());
draw_text(60, 120, global.chrStatus[? "money"]);
#endregion
draw_set_alpha(1);

#region Ammo
draw_set_halign(fa_center);
draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) + 32, global.chrStatus[? "rangerAmmo"])
draw_set_halign(fa_left);
#endregion