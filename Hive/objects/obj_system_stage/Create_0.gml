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
	// TODO 캐릭터 복제버그 수정
	with (Door) {
		if (global.previousPos == POS.TOP || global.previousPos == POS.TOP_LEFT || global.previousPos == POS.TOP_RIGHT) {
			if (pos == POS.BOTTOM || pos == POS.BOTTOM_RIGHT || pos == POS.BOTTOM_LEFT) {
				instance_create_depth(x, y - 64, 0, obj_chr);
			}
		}
		
		if (global.previousPos == POS.RIGHT || global.previousPos == POS.RIGHT_TOP || global.previousPos == POS.RIGHT_BOTTOM) {
			if (pos == POS.LEFT || pos == POS.LEFT_BOTTOM || pos == POS.LEFT_TOP) {
				instance_create_depth(x + 64, y, 0, obj_chr);
			}
		}
		
		if (global.previousPos == POS.BOTTOM || global.previousPos == POS.BOTTOM_RIGHT || global.previousPos == POS.BOTTOM_LEFT) {
			if (pos == POS.TOP || pos == POS.TOP_LEFT || pos == POS.TOP_RIGHT) {
				instance_create_depth(x, y + 64, 0, obj_chr);
			}
		}

		if (global.previousPos == POS.LEFT || global.previousPos == POS.LEFT_BOTTOM || global.previousPos == POS.LEFT_TOP) {
			if (pos == POS.RIGHT || pos == POS.RIGHT_TOP || pos == POS.RIGHT_BOTTOM) {
				instance_create_depth(x - 64, y, 0, obj_chr);
			}
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