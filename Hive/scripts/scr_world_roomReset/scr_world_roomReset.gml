/// @description 룸 정보 초기화
/// @param index

var index = argument0;
var shape = argument1;

worldList[| index] = ds_list_create();
ds_list_mark_as_list(worldList, index);

var worldIndex = worldList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);

var infoMap = worldIndex[| MARK.INFO];
infoMap[? "shape"] = shape;