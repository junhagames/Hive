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
	var block = instance_create_layer(x, y, "layer_block", obj_solid_block);
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

// Pathfinding grid
enemyGridPath = mp_grid_create(0, 0, room_width div CELL_WIDTH, room_height div CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
mp_grid_add_instances(enemyGridPath, obj_solid_block, false);
mp_grid_add_instances(enemyGridPath, obj_parent_entry, false);

scr_minimap_create();