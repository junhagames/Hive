/// @description 인스턴스 정보 불러오기
/// @param instMap

var instMap = argument0;

switch (instMap[? "object"]) {
	#region obj_solid_rock
	case obj_solid_rock:
		hp = instMap[? "hp"];
		break;
	#endregion
	#region obj_stuff_supply
	case obj_stuff_supply:
		isUse = instMap[? "isUse"];
		break;
	#endregion
	#region default
	default:
		#region obj_parent_enemy
		var enemyList = global.objParentMap[? obj_parent_enemy];

		for (var j = 0; j < ds_list_size(enemyList); j++) {
			if (instMap[? "object"] == enemyList[| j]) {
				hp = instMap[? "hp"];
			}
		}
		#endregion
		#region obj_parent_altar
		var altarList = global.objParentMap[? obj_parent_altar];

		for (var j = 0; j < ds_list_size(altarList); j++) {
			if (instMap[? "object"] == altarList[| j]) {
				hp = instMap[? "hp"];
			}
		}
		#endregion
		break;
	#endregion
}