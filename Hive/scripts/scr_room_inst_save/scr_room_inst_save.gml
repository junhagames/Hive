/// @description 룸 메모리 세이브

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

with (obj_solid_rock) {
	var instIndex = ds_map_size(instMap);
	ds_map_add_map(instMap, instIndex, ds_map_create());

	var _instMap = instMap[? instIndex];
	_instMap[? "id"] = id;
	_instMap[? "hp"] = hp;
}

with (obj_parent_enemy) {
	var instIndex = ds_map_size(instMap);
	ds_map_add_map(instMap, instIndex, ds_map_create());

	var _instMap = instMap[? instIndex];
	_instMap[? "id"] = id;
	_instMap[? "hp"] = hp;
}