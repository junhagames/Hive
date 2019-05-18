/// @description 인스턴스 정보 저장

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

for (var i = 0; i < ds_map_size(instMap); i++) {
	var _instMap = instMap[? i];

	with (_instMap[? "id"]) {
		if (_instMap[? "object"] == obj_solid_rock) {
			// obj_solid_rock
			_instMap[? "hp"] = hp;
		}
		else {
			// obj_parent_enemy
			var enemyList = global.objParentMap[? obj_parent_enemy];

			for (var j = 0; j < ds_list_size(enemyList); j++) {
				if (_instMap[? "object"] == enemyList[| j]) {
					_instMap[? "hp"] = hp; 
				}
			}
			
			// obj_parent_altar
			var altarList = global.objParentMap[? obj_parent_altar];

			for (var j = 0; j < ds_list_size(altarList); j++) {
				if (_instMap[? "object"] == altarList[| j]) {
					_instMap[? "hp"] = hp;
				}
			}
		}
	}
}