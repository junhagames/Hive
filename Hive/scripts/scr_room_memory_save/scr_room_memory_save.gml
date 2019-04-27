/// @description 룸 메모리 저장

var worldIndex = global.worldList[| global.currentIndex];
var memoryIndex = worldIndex[| MARK.MEMORY];

with (obj_solid_rock) {
	for (var i = 0; i < ds_list_size(memoryIndex); i++) {
		var memoryMap = memoryIndex[| i];

		if (memoryMap[? "id"] == id) {
			memoryMap[? "hp"] = hp;
			break;
		}
	}
}

with (obj_parent_enemy) {
	for (var i = 0; i < ds_list_size(memoryIndex); i++) {
		var memoryMap = memoryIndex[| i];

		if (memoryMap[? "id"] == id) {
			memoryMap[? "hp"] = hp;
			break;
		}
	}
}