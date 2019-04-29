/// @description 룸 메모리 불러오기

var _roomMap = global.roomMap[? global.currentIndex];
var memoryMap = _roomMap[? "memory"];

for (var i = 0; i < ds_map_size(memoryMap); i++) {
	var _memoryMap = memoryMap[? i];
	
	with (_memoryMap[? "id"]) {
		hp = _memoryMap[? "hp"];
	}
}