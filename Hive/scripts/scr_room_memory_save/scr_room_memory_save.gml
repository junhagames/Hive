/// @description 룸 메모리 세이브

var _roomMap = global.roomMap[? global.currentIndex];
var memoryMap = _roomMap[? "memory"];

with (obj_solid_rock) {
	var memoryIndex = ds_map_size(memoryMap);
	ds_map_add_map(memoryMap, memoryIndex, ds_map_create());

	var _memoryMap = memoryMap[? memoryIndex];
	_memoryMap[? "id"] = id;
	_memoryMap[? "hp"] = hp;
}

with (obj_parent_enemy) {
	var memoryIndex = ds_map_size(memoryMap);
	ds_map_add_map(memoryMap, memoryIndex, ds_map_create());

	var _memoryMap = memoryMap[? memoryIndex];
	_memoryMap[? "id"] = id;
	_memoryMap[? "hp"] = hp;
}