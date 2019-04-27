/// @description 룸 초기화
/// @param index
/// @param shape
///	@param event

var index = argument0;
var shape = argument1;
var event = argument2;

global.worldList[| index] = ds_list_create();
ds_list_mark_as_list(global.worldList, index);

var worldIndex = global.worldList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
worldIndex[| MARK.ENTRY] = ds_list_create();
worldIndex[| MARK.KEEP] = ds_list_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);
ds_list_mark_as_list(worldIndex, MARK.ENTRY);
ds_list_mark_as_list(worldIndex, MARK.KEEP);

// Add room info
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

var childRoom;

switch (shape) {
	case SHAPE.SMALL:
		var childRoom = global.roomHierarchy[? room_parent_stage_small];
		break;
	case SHAPE.BIG:
		var childRoom = global.roomHierarchy[? room_parent_stage_big];
		break;
	case SHAPE.WLONG:
		var childRoom = global.roomHierarchy[? room_parent_stage_wlong];
		break;
	case SHAPE.HLONG:
		var childRoom = global.roomHierarchy[? room_parent_stage_hlong];
		break;
}
infoMap[? "room"] = irandom_range(childRoom[| 0], childRoom[| 0] + ds_list_size(childRoom) - 1);