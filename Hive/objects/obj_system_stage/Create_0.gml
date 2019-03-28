var worldIndex = global.worldList[| global.currentIndex];
var infoMap = worldIndex[| MARK.INFO];
var shape = infoMap[? "shape"];

// Create player
if (global.previousPos == noone) {
	instance_create_depth(room_width / 2, room_height / 2, 0, obj_chr);
}
else {
	
}

// Create entry
var entryIndex = worldIndex[| MARK.ENTRY];

with (Door) {
	var isEntry = false;
	
	for (var i = 0; i < ds_list_size(entryIndex); i++) {
		var entryMap = entryIndex[| i];
		
		if (pos == entryMap[? "pos"]) {
			isEntry = true;
			target_roomId =  entryMap[? "target_roomId"];
		}
	}
	
	if (!isEntry) {
		instance_destroy();
	}
}

// Create hive
var hiveIndex = worldIndex[| MARK.HIVE];

for (var i = 0; i < ds_list_size(hiveIndex); i++) {
	var hiveMap = hiveIndex[| i];
	var hive = instance_create_depth(hiveMap[? "x"], hiveMap[? "y"], 0, obj_hive1);
	
	with (hive) {
		hive_id = hiveMap[? "id"];
	}
}