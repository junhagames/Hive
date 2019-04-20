/// @description 룸 초기화
/// @param index
/// @param shape

var index = argument0;
var shape = argument1;

global.worldList[| index] = ds_list_create();
ds_list_mark_as_list(global.worldList, index);

var worldIndex = global.worldList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
worldIndex[| MARK.ENTRY] = ds_list_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);
ds_list_mark_as_list(worldIndex, MARK.ENTRY);

var infoMap = worldIndex[| MARK.INFO];

// Add room info
infoMap[? "index"] = index;
infoMap[? "shape"] = shape;
infoMap[? "search"] = SEARCH.UNKNOWN;

var roomSelect;

switch (shape) {
	case SHAPE.SMALL:
		roomSelect = choose(room_stage_small1);
		break;
	case SHAPE.BIG:
		roomSelect = choose(room_stage_big1);
		break;
	case SHAPE.WLONG:
		roomSelect = choose(room_stage_wlong1);
		break;
	case SHAPE.HLONG:
		roomSelect = choose(room_stage_hlong1);
		break;
}
infoMap[? "room"] = roomSelect;