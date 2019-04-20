/// @description 미니맵 생성

var overlapList = ds_list_create();
minimapSuf = surface_create(ds_grid_width(global.worldGrid) * sprite_get_width(spr_ui_minimap_small),
	ds_grid_height(global.worldGrid) * sprite_get_height(spr_ui_minimap_small));

surface_set_target(minimapSuf);
draw_clear_alpha(c_black, 0);

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (ds_list_find_index(overlapList, index) == -1 && index != WALL) {
			var worldIndex = global.worldList[| index];
			var infoMap = worldIndex[| MARK.INFO];
			var color = make_color_hsv(10 * index % 255, 255, 255);
			ds_list_add(overlapList, index);

			switch (infoMap[? "shape"]) {
				#region SMALL
					case SHAPE.SMALL:			
						if (index == global.currentIndex) {
							minimapX = _x * 32 + sprite_get_width(spr_ui_minimap_small) / 2 - 100;
							minimapY = _y * 32 + sprite_get_height(spr_ui_minimap_small) / 2 - 100;
							color = c_white;
						}
						draw_sprite_ext(spr_ui_minimap_small, infoMap[? "search"], _x * 32, _y * 32, 1, 1, 0, color, 1);
						break;
					#endregion
				#region BIG
					case SHAPE.BIG:
						if (index == global.currentIndex) {
							minimapX = _x * 32 + sprite_get_width(spr_ui_minimap_big) / 2 - 100;
							minimapY = _y * 32 + sprite_get_height(spr_ui_minimap_big) / 2 - 100;
							color = c_white;
						}
						draw_sprite_ext(spr_ui_minimap_big, infoMap[? "search"], _x * 32, _y * 32, 1, 1, 0, color, 1);
						break;
					#endregion
				#region WLONG
					case SHAPE.WLONG:
						if (index == global.currentIndex) {
							minimapX = _x * 32 + sprite_get_width(spr_ui_minimap_wlong) / 2 - 100;
							minimapY = _y * 32 + sprite_get_height(spr_ui_minimap_wlong) / 2 - 100;
							color = c_white;
						}
						draw_sprite_ext(spr_ui_minimap_wlong, infoMap[? "search"], _x * 32, _y * 32, 1, 1, 0, color, 1);
						break;
					#endregion
				#region HLONG
					case SHAPE.HLONG:
						if (index == global.currentIndex) {
							minimapX = _x * 32 + sprite_get_width(spr_ui_minimap_hlong) / 2 - 100;
							minimapY = _y * 32 + sprite_get_height(spr_ui_minimap_hlong) / 2 - 100;
							color = c_white;
						}
						draw_sprite_ext(spr_ui_minimap_hlong, infoMap[? "search"], _x * 32, _y * 32, 1, 1, 0, color, 1);
						break;
					#endregion
			}
		}
	}
}
surface_reset_target();
ds_list_destroy(overlapList);