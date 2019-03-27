/// @description 룸 정보 초기화
/// @param index

var index = argument0;
var shape = argument1;

worldList[| index] = ds_list_create();
ds_list_mark_as_list(worldList, index);

var worldIndex = worldList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
worldIndex[| MARK.ENTRY] = ds_list_create();
worldIndex[| MARK.HIVE] = ds_list_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);
ds_list_mark_as_list(worldIndex, MARK.ENTRY);
ds_list_mark_as_list(worldIndex, MARK.HIVE);

var infoMap = worldIndex[| MARK.INFO];
infoMap[? "shape"] = shape;

#region Add hive
var hiveIndex = worldIndex[| MARK.HIVE];

for (var i = 0; i < 3; i++) {
	hiveIndex[| i] = ds_map_create();
	ds_list_mark_as_map(hiveIndex, i);
	
	var hiveMap = hiveIndex[| i];
	hiveMap[? "id"] = i;
	hiveMap[? "x"] = random(room_width);
	hiveMap[? "y"] = random(room_height);
	hiveMap[? "hp"] = 100;
}
#endregion