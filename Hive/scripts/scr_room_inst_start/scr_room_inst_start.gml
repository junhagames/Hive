/// @description 인스턴스 정보 초기화|불러오기

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

if (ds_map_empty(instMap)) {
	// 인스턴스 정보 초기화
	with (obj_solid_rock) {
		var instIndex = ds_map_size(instMap);
		ds_map_add_map(instMap, instIndex, ds_map_create());

		var _instMap = instMap[? instIndex];
		_instMap[? "id"] = id;
		_instMap[? "object"] = object_index;
		_instMap[? "hp"] = hp;
	}
	
	with (obj_stuff_supply) {
		var instIndex = ds_map_size(instMap);
		ds_map_add_map(instMap, instIndex, ds_map_create());

		var _instMap = instMap[? instIndex];
		_instMap[? "id"] = id;
		_instMap[? "object"] = object_index;
		_instMap[? "isUse"] = isUse;
	}
	
	with (obj_parent_enemy) {
		var instIndex = ds_map_size(instMap);
		ds_map_add_map(instMap, instIndex, ds_map_create());

		var _instMap = instMap[? instIndex];
		_instMap[? "id"] = id;
		_instMap[? "object"] = object_index;
		_instMap[? "hp"] = hp;
	}
	
	with (obj_parent_altar) {
		var instIndex = ds_map_size(instMap);
		ds_map_add_map(instMap, instIndex, ds_map_create());

		var _instMap = instMap[? instIndex];
		_instMap[? "id"] = id;
		_instMap[? "object"] = object_index;
		_instMap[? "hp"] = hp;
	}
}
else {
	// 인스턴스 정보 불러오기
	for (var i = 0; i < ds_map_size(instMap); i++) {
		var _instMap = instMap[? i];
		
		with (_instMap[? "id"]) {
			scr_inst_map_load(_instMap);
		}
	}
}