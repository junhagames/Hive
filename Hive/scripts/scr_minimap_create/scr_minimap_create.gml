/// @description 미니맵 생성

var overlapList = ds_list_create();
minimapSuf = surface_create(ds_grid_width(global.worldGrid) * sprite_get_width(spr_ui_minimap_small) * 1.5,
	ds_grid_height(global.worldGrid) * sprite_get_height(spr_ui_minimap_small) * 1.5);

surface_set_target(minimapSuf);
draw_clear_alpha(c_white, 0);

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (ds_list_find_index(overlapList, index) == -1 && index != WALL) {
			var worldIndex = global.worldList[| index];
			var infoMap = worldIndex[| MARK.INFO]; 
			var sprite, color;
			ds_list_add(overlapList, index);

			switch (infoMap[? "shape"]) {
				#region SMALL
				case SHAPE.SMALL:			
					sprite = spr_ui_minimap_small;
					break;
				#endregion
				#region BIG
				case SHAPE.BIG:
					sprite = spr_ui_minimap_big;
					break;
				#endregion
				#region WLONG
				case SHAPE.WLONG:
					sprite = spr_ui_minimap_wlong;
					break;
				#endregion
				#region HLONG
				case SHAPE.HLONG:
					sprite = spr_ui_minimap_hlong;
					break;
				#endregion
			}
			
			var marginX = ds_grid_width(global.worldGrid) * 0.25;
			var marginY = ds_grid_height(global.worldGrid) * 0.25;
			
			if (index == global.currentIndex) {
				minimapX = _x * sprite_get_width(spr_ui_minimap_small) + sprite_get_width(sprite) / 2 + sprite_get_width(spr_ui_minimap_small) * marginX - 100;
				minimapY = _y * sprite_get_height(spr_ui_minimap_small) + sprite_get_height(sprite) / 2 + sprite_get_height(spr_ui_minimap_small) * marginY - 100;
				color = c_white;
			}
			else {
				color = make_color_hsv(10 * (index mod 255), 255, 255);	
			}
			
			if (infoMap[? "search"] != SEARCH.UNKNOWN) {
				draw_sprite_ext(sprite, infoMap[? "search"],
					_x * sprite_get_width(spr_ui_minimap_small) + sprite_get_width(spr_ui_minimap_small) * marginX,
					_y * sprite_get_height(spr_ui_minimap_small) + sprite_get_height(spr_ui_minimap_small) * marginY,
					1, 1, 0, color, 1);
			}
		}
	}
}
surface_reset_target();
ds_list_destroy(overlapList);