var worldIndex = global.worldList[| global.currentIndex];
var infoMap = worldIndex[| MARK.INFO];
var entryIndex = worldIndex[| MARK.ENTRY];

// Set search
infoMap[? "search"] = SEARCH.KNOWN;

#region Create entry
with (obj_parent_entry) {
	var isEntry = false;
	
	for (var i = 0; i < ds_list_size(entryIndex); i++) {
		var entryMap = entryIndex[| i];
		
		if (pos == entryMap[? "pos"]) {
			targetIndex = entryMap[? "targetIndex"];
			var _worldIndex = global.worldList[| targetIndex];
			var _infoMap = _worldIndex[| MARK.INFO];
			
			if (_infoMap[? "search"] == SEARCH.UNKNOWN) { 
				_infoMap[? "search"] = SEARCH.CLOSE;
			}
			isEntry = true;
			break;
		}
	}
	var block = instance_create_layer(x, y, "layer_block", obj_block);
	block.image_xscale = sprite_width / block.sprite_width;
	block.image_yscale = sprite_height / block.sprite_height;
		
	if (isEntry) {
		blockID = block.id;
	}
	else {
		instance_destroy();
	}
}
#endregion
#region Create player|system
var startX, startY; 

if (global.previousIndex == noone) {
	startX = room_width / 2;
	startY = room_height / 2;
}
else {
	with (obj_parent_entry) {
		var entryw = (bbox_left + bbox_right) / 2;
		var entryh = (bbox_top + bbox_bottom) / 2;
		var chrw = 80;
		var chrh = 80;

		if (targetIndex == global.previousIndex && !instance_exists(obj_chr)) {
			var entryCount = 0;
			
			for (var i = 0; i < ds_list_size(entryIndex); i++) {
				var entryMap = entryIndex[| i];
					
				if (targetIndex == entryMap[? "targetIndex"]) {
					entryCount++;
				}
			}
			
			if (global.previousPos == POS.TOP || global.previousPos == POS.TOP_LEFT || global.previousPos == POS.TOP_RIGHT) {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == POS.TOP_LEFT && pos == POS.BOTTOM_LEFT) || (global.previousPos == POS.TOP_RIGHT && pos == POS.BOTTOM_RIGHT)))) {
					startX = entryw;
					startY = entryh - chrh;
				}
			}
			else if (global.previousPos == POS.RIGHT || global.previousPos == POS.RIGHT_TOP || global.previousPos == POS.RIGHT_BOTTOM) {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == POS.RIGHT_TOP && pos == POS.LEFT_TOP) || (global.previousPos == POS.RIGHT_BOTTOM && pos == POS.LEFT_BOTTOM)))) {
					startX = entryw + chrw;
					startY = entryh;
				}
			}
			else if (global.previousPos == POS.BOTTOM || global.previousPos == POS.BOTTOM_RIGHT || global.previousPos == POS.BOTTOM_LEFT) {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == POS.BOTTOM_RIGHT && pos == POS.TOP_RIGHT) || (global.previousPos == POS.BOTTOM_LEFT && pos == POS.TOP_LEFT)))) {
					startX = entryw;
					startY = entryh + chrh;
				}
			}
			else if (global.previousPos == POS.LEFT || global.previousPos == POS.LEFT_BOTTOM || global.previousPos == POS.LEFT_TOP) {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == POS.LEFT_BOTTOM && pos == POS.RIGHT_BOTTOM) || (global.previousPos == POS.LEFT_TOP && pos == POS.RIGHT_TOP)))) {
					startX = entryw - chrw;
					startY = entryh;
				}
			}
		}
	}
}
instance_create_layer(startX, startY, "layer_inst", obj_chr);
instance_create_layer(0, 0, "layer_system", obj_camera);
instance_create_layer(0, 0, "layer_draw", obj_draw);
#endregion
#region Create enemy
for (var i = 0; i < 3; i++) {
	instance_create_layer(random_range(100, room_width - 100), random_range(100, room_height - 100), "layer_inst", choose(obj_insect1, obj_hive1));
}

enemyGridPath = mp_grid_create(0, 0, room_width div CELL_WIDTH, room_height div CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
mp_grid_add_instances(enemyGridPath, obj_block, false);
mp_grid_add_instances(enemyGridPath, obj_parent_entry, false);
#endregion
#region Create Minimap
var list = ds_list_create();
minimapSuf = surface_create(ds_grid_width(global.worldGrid) * sprite_get_width(spr_ui_minimap_small), ds_grid_height(global.worldGrid) * sprite_get_height(spr_ui_minimap_small));
minimapX = NULL;
minimapY = NULL;

surface_set_target(minimapSuf);
draw_clear_alpha(c_black, 0);

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (ds_list_find_index(list, index) == -1 && index != WALL) {
			var worldIndex = global.worldList[| index];
			var infoMap = worldIndex[| MARK.INFO];
			var color = make_color_hsv(10 * index % 255, 255, 255);
			ds_list_add(list, index);

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
ds_list_destroy(list);
#endregion