/// @description 게임 룸 저장
var infoList = ds_list_create();
var memoryList = ds_list_create();

// 룸 정보 저장
for (var i = 0; i < ds_list_size(global.roomList); i++) {
	var worldIndex = global.roomList[| i];
	var infoMap = worldIndex[| MARK.INFO];
	var _infoMap = ds_map_create();
	ds_map_copy(_infoMap, infoMap);
	ds_list_add(infoList, _infoMap);
	ds_list_mark_as_map(infoList, ds_list_size(infoList) - 1);
	
	var memoryIndex = worldIndex[| MARK.MEMORY];

	for (var j = 0; j < ds_list_size(memoryIndex); j++) {
		var memoryMap = memoryIndex[| j];
		var _memoryMap = ds_map_create();
		ds_map_copy(_memoryMap, memoryMap);
		ds_list_add(memoryList, _memoryMap);
		ds_list_mark_as_map(memoryList, ds_list_size(memoryList) - 1);
	}
}
ds_map_add_list(global.saveMap, "infoList", infoList);
ds_map_add_list(global.saveMap, "memoryList", memoryList);

// 캐릭터 정보 저장
var _chrMap = ds_map_create();
ds_map_copy(_chrMap, global.chrMap);
ds_map_add_map(global.saveMap, "chrMap", _chrMap);

// 현재 위치 저장
global.saveMap[? "currentIndex"] = global.currentIndex;

scr_save_file("save.sav");

ds_list_destroy(infoList);
ds_list_destroy(memoryList);