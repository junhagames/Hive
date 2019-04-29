/// @description 룸 초기화
/// @param index
/// @param shape
///	@param event

var index = argument0;
var shape = argument1;
var event = argument2;

ds_map_add_map(global.roomMap, index, ds_map_create());
var _roomMap =  global.roomMap[? index];

ds_map_add_map(_roomMap, "info", ds_map_create());
ds_map_add_map(_roomMap, "entry", ds_map_create());
ds_map_add_map(_roomMap, "memory", ds_map_create());

// 룸 정보 추가
var infoMap = _roomMap[? "info"];
infoMap[? "shape"] = shape;
infoMap[? "event"] = event;

// 보급품 시야 밝히기
if (event == "supply") {
	infoMap[? "search"] = "close";
}
else {
	infoMap[? "search"] = "unknown";
}

// 룸 지정
if (index == 0) {
	infoMap[? "room"] = room_stage_start;
}
else {
	var roomList;

	switch (shape) {
		case "small":
			roomList = global.roomParentMap[? room_parent_stage_small];
			break;
		case "big":
			roomList = global.roomParentMap[? room_parent_stage_big];
			break;
		case "wlong":
			roomList = global.roomParentMap[? room_parent_stage_wlong];
			break;
		case "hlong":
			roomList = global.roomParentMap[? room_parent_stage_hlong];
			break;
	}
	infoMap[? "room"] = irandom_range(roomList[| 0], roomList[| 0] + ds_list_size(roomList) - 1);
}