var worldIndex = global.worldList[| global.currentIndex];
var infoMap = worldIndex[| MARK.INFO];
var entryIndex = worldIndex[| MARK.ENTRY];

#region Create entry
with (Door) {
	var isEntry = false;
	
	for (var i = 0; i < ds_list_size(entryIndex); i++) {
		var entryMap = entryIndex[| i];
		
		if (pos == entryMap[? "pos"]) {
			isEntry = true;
			target_roomId =  entryMap[? "target_roomId"];
			break;
		}
	}
	
	if (!isEntry) {
		instance_destroy();
	}
}
#endregion
#region Create player
if (global.previousIndex == noone) {
	instance_create_depth(room_width / 2, room_height / 2, 0, obj_chr);
}
else {
	var _worldIndex = global.worldList[| global.previousIndex];
	var _infoMap = _worldIndex[| MARK.INFO];
	var _entryIndex = _worldIndex[| MARK.ENTRY];
	
	if (!isEntry) {
		instance_destroy();
	}
	
	with (Door) {
		switch (_infoMap[? "shape"]) {
			case SHAPE.SMALL:
				if (global.previousPos == POS.TOP &&
					(pos == POS.BOTTOM || pos == POS.BOTTOM_RIGHT || pos == POS.BOTTOM_LEFT)) {
					instance_create_depth(x, y - 64, 0, obj_chr);
				}
		
				if (global.previousPos == POS.RIGHT &&
					(pos == POS.LEFT || pos == POS.LEFT_BOTTOM || pos == POS.LEFT_TOP)) {
					instance_create_depth(x + 64, y, 0, obj_chr);
				}
				
				if (global.previousPos == POS.BOTTOM &&
					(pos == POS.TOP || pos == POS.TOP_LEFT || pos == POS.TOP_RIGHT)) {
					instance_create_depth(x, y + 64, 0, obj_chr);
				}
				
				if (global.previousPos == POS.LEFT &&
					(pos == POS.RIGHT || pos == POS.RIGHT_TOP || pos == POS.RIGHT_BOTTOM)) {
					instance_create_depth(x - 64, y, 0, obj_chr);
				}
				break;
				
			case SHAPE.BIG:
				if (global.previousPos == POS.TOP_LEFT) {
					var entryCount = 0;
					
					for (var i = 0; i < ds_list_size(_entryIndex); i++) {
						if (pos == target_roomId) {
							entryCount++;
						}
					}
					
					if (entryCount == 1) {
					
					}
					else {
						
					}
				}
		
				//if (global.previousPos == POS.RIGHT &&
				//	(pos == POS.LEFT || pos == POS.LEFT_BOTTOM || pos == POS.LEFT_TOP)) {
				//	instance_create_depth(x + 64, y, 0, obj_chr);
				//}
				
				//if (global.previousPos == POS.BOTTOM &&
				//	(pos == POS.TOP || pos == POS.TOP_LEFT || pos == POS.TOP_RIGHT)) {
				//	instance_create_depth(x, y + 64, 0, obj_chr);
				//}
				
				//if (global.previousPos == POS.LEFT &&
				//	(pos == POS.RIGHT || pos == POS.RIGHT_TOP || pos == POS.RIGHT_BOTTOM)) {
				//	instance_create_depth(x - 64, y, 0, obj_chr);
				//}
				break;
		}
	}
}
#endregion
#region Create Camera
with (obj_chr) {
	instance_create_depth(x, y, 0, obj_camera);
}
#endregion
#region Create hive
var hiveIndex = worldIndex[| MARK.HIVE];

for (var i = 0; i < ds_list_size(hiveIndex); i++) {
	var hiveMap = hiveIndex[| i];
	var hive = instance_create_depth(hiveMap[? "x"], hiveMap[? "y"], 0, obj_hive1);
	
	with (hive) {
		hive_id = hiveMap[? "id"];
	}
}
#endregion