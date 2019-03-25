/// @description 새로운 룸 추가
/// @param index
/// @param pos_x
/// @param pos_y

var index = argument0;
var pos_x = argument1;
var pos_y = argument2;

worldList[| index] = ds_list_create();
ds_list_mark_as_list(worldList, index);
indexList = worldList[| index];
indexList[| MARK.ENTRY] = ds_list_create();
indexList[| MARK.OBJECT] = ds_map_create();
ds_list_mark_as_list(indexList, MARK.ENTRY);
ds_list_mark_as_map(indexList, MARK.OBJECT);

var roomList = indexList[| MARK.ENTRY];
var roomMap = indexList[| MARK.OBJECT];

if (pos_x > 0) {
	if (worldGrid[# pos_x - 1, pos_y] != index) {
		// <- 좌측 입구
	}
}

if (pos_x < ds_grid_width(worldGrid) - 1) {
	if (worldGrid[# pos_x + 1, pos_y] != index) {
		// -> 좌측 입구
	}
}

if (pos_y > 0) {
	if (worldGrid[# pos_x, pos_y - 1] != index) {
		// ^ 상단 입구
	}
}

if (pos_y < ds_grid_height(worldGrid) - 1) {
	if (worldGrid[# pos_x, pos_y + 1] != index) {
		// v 하단 입구
	}
}