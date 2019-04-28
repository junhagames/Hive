/// @description 룸 메모리 파괴

var worldIndex = global.roomList[| global.currentIndex];
var memoryIndex = worldIndex[| MARK.MEMORY];

for (var i = 0; i < ds_list_size(memoryIndex); i++) {
	var memoryMap = memoryIndex[| i];
	
	if (memoryMap[? "id"] == id) {
		memoryMap[? "hp"] = 0;
		break;
	}
}