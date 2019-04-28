/// @description 룸 메모리 초기화

var worldIndex = global.roomList[| global.currentIndex];
var memoryIndex = worldIndex[| MARK.MEMORY];

with (obj_solid_rock) {
	memoryIndex[| ds_list_size(memoryIndex)] = ds_map_create();
	ds_list_mark_as_map(memoryIndex, ds_list_size(memoryIndex) - 1);

	var memoryMap = memoryIndex[| ds_list_size(memoryIndex) - 1];
	memoryMap[? "id"] = id;
}

with (obj_parent_enemy) {
	memoryIndex[| ds_list_size(memoryIndex)] = ds_map_create();
	ds_list_mark_as_map(memoryIndex, ds_list_size(memoryIndex) - 1);

	var memoryMap = memoryIndex[| ds_list_size(memoryIndex) - 1];
	memoryMap[? "id"] = id;
	memoryMap[? "hp"] = hp;
}