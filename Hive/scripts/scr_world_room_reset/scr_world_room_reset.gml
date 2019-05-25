/// @description 룸 초기화
/// @param index
/// @param shape
///	@param event
/// @param room

var index = argument0;
var shape = argument1;
var event = argument2;
var _room = argument3;

ds_map_add_map(global.roomMap, index, ds_map_create());
var _roomMap =  global.roomMap[? index];

ds_map_add_map(_roomMap, "info", ds_map_create());
ds_map_add_map(_roomMap, "entry", ds_map_create());
ds_map_add_map(_roomMap, "inst", ds_map_create());

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
infoMap[? "room"] = _room;