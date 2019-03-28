/// @description 룸 정보 초기화
/// @param index

var index = argument0;
var shape = argument1;

global.worldList[| index] = ds_list_create();
ds_list_mark_as_list(global.worldList, index);

var worldIndex = global.worldList[| index];
worldIndex[| MARK.INFO] = ds_map_create();
worldIndex[| MARK.ENTRY] = ds_list_create();
worldIndex[| MARK.HIVE] = ds_list_create();
ds_list_mark_as_map(worldIndex, MARK.INFO);
ds_list_mark_as_list(worldIndex, MARK.ENTRY);
ds_list_mark_as_list(worldIndex, MARK.HIVE);

var infoMap = worldIndex[| MARK.INFO];

// Add room info
infoMap[? "index"] = index;
infoMap[? "shape"] = shape;

#region Add room kind
var roomKind;

switch (shape) {
	case SHAPE.SMALL:
		roomKind = choose(room_stage_small1, room_stage_small2);
		break;
	case SHAPE.BIG:
		roomKind = choose(room_stage_big1);
		break;
	case SHAPE.WLONG:
		roomKind = choose(room_stage_wlong1);
		break;
	case SHAPE.HLONG:
		roomKind = choose(room_stage_hlong1);
		break;
}
infoMap[? "room"] = roomKind;
#endregion

#region Add room hive
var hiveIndex = worldIndex[| MARK.HIVE];

for (var i = 0; i < 3; i++) {
	hiveIndex[| i] = ds_map_create();
	ds_list_mark_as_map(hiveIndex, i);
	
	var hiveMap = hiveIndex[| i];
	hiveMap[? "id"] = i;
	hiveMap[? "hpMax"] = 100;
	hiveMap[? "hp"] = hiveMap[? "hpMax"];
	
	switch (shape) {
		case SHAPE.SMALL:
			hiveMap[? "x"] = random(SMALL_WIDTH);
			hiveMap[? "y"] = random(SMALL_HEIGHT);
			break;
		case SHAPE.BIG:
			hiveMap[? "x"] = random(BIG_WIDTH);
			hiveMap[? "y"] = random(BIG_HEIGHT);
			break;
		case SHAPE.WLONG:
			hiveMap[? "x"] = random(WLONG_WIDTH);
			hiveMap[? "y"] = random(WLONG_HEIGHT);
			break;
		case SHAPE.HLONG:
			hiveMap[? "x"] = random(HLONG_WIDTH);
			hiveMap[? "y"] = random(HLONG_HEIGHT);
			break;
	}
}
#endregion