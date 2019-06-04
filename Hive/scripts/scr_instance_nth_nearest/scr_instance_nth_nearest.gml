/// @description n번째로 가까운 인스턴스 반환
/// @param x
/// @param y
/// @param obj
/// @param n

var _x = argument0;
var _y = argument1;
var obj = argument2;
var n = argument3;

var list = ds_priority_create();
var nearest = noone;

with (obj) {
	ds_priority_add(list, id, distance_to_point(_x, _y));
}

repeat (n) {
	nearest = ds_priority_delete_min(list);
}
ds_priority_destroy(list);

return nearest;