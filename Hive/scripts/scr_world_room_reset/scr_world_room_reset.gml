/// @description 룸 초기화
/// @param index
/// @param shape
///	@param event

var index = argument0;
var shape = argument1;
var event = argument2;

global.roomList[| index] = ds_list_create();
ds_list_mark_as_list(global.roomList, index);

var worldIndex = global.roomList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
worldIndex[| MARK.ENTRY] = ds_list_create();
worldIndex[| MARK.MEMORY] = ds_list_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);
ds_list_mark_as_list(worldIndex, MARK.ENTRY);
ds_list_mark_as_list(worldIndex, MARK.MEMORY);

// 룸 정보 추가
var infoMap = worldIndex[| MARK.INFO];
infoMap[? "index"] = index;
infoMap[? "shape"] = shape;
infoMap[? "event"] = event;

// 보급품 시야 밝히기
if (event == EVENT.SUPPLY) {
	infoMap[? "search"] = SEARCH.CLOSE;
}
else {
	infoMap[? "search"] = SEARCH.UNKNOWN;
}

// 룸 설정
if (index == 0) {
	infoMap[? "room"] = room_stage_start;
}
else {
	var roomList;

	switch (shape) {
		case SHAPE.SMALL:
			roomList = global.roomParentMap[? room_parent_stage_small];
			break;
		case SHAPE.BIG:
			roomList = global.roomParentMap[? room_parent_stage_big];
			break;
		case SHAPE.WLONG:
			roomList = global.roomParentMap[? room_parent_stage_wlong];
			break;
		case SHAPE.HLONG:
			roomList = global.roomParentMap[? room_parent_stage_hlong];
			break;
	}
	infoMap[? "room"] = irandom_range(roomList[| 0], roomList[| 0] + ds_list_size(roomList) - 1);
}