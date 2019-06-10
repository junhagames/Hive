/// @description 인스턴스 정보 저장
/// @param instMap

var instMap = argument0;

switch (instMap[? "object"]) {
	#region obj_solid_rock
	case obj_solid_rock:
		instMap[? "hp"] = hp;
		break;
	#endregion
	#region obj_stuff_supply
	case obj_stuff_supply:
		instMap[? "isUse"] = isUse;
		break;
	#endregion
	#region default
	default:
		var isBreak = false;
		#region obj_parent_enemy
		var enemyList = global.objParentMap[? obj_parent_enemy];
		
		for (var j = 0; j < ds_list_size(enemyList); j++) {
			if (instMap[? "object"] == enemyList[| j]) {
				instMap[? "hp"] = hp;
				isBreak = true;
				break;
			}
		}
		
		if (isBreak) {
			break;
		}
		#endregion
		#region obj_parent_altar
		var altarList = global.objParentMap[? obj_parent_altar];
		
		for (var j = 0; j < ds_list_size(altarList); j++) {
			if (instMap[? "object"] == altarList[| j]) {
				instMap[? "hp"] = hp;
				isBreak = true;
				break;
			}
		}
		
		if (isBreak) {
			break;
		}
		#endregion
		break;
	#endregion
}