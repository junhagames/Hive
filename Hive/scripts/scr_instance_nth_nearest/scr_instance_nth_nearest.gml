/// @description n번째로 가까운 인스턴스 반환
/// @param pointX
/// @param pointY
/// @param obj
/// @param n

var pointX = argument0;
var pointY = argument1;
var obj = argument2;
var n = argument3;

var list = ds_priority_create();
var nearest = noone;
n = min(max(1, n), instance_number(obj));

with (obj) {
	ds_priority_add(list, id, distance_to_point(pointX, pointY));
}

repeat (n) {
	nearest = ds_priority_delete_min(list);
}
ds_priority_destroy(list);

return nearest;