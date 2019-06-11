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
		var isBreak = false;
		#region obj_parent_enemy
		var enemyList = global.objParentMap[? obj_parent_enemy];

		for (var i = 0; i < ds_list_size(enemyList); i++) {
			if (instMap[? "object"] == enemyList[| i]) {
				hp = instMap[? "hp"];
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

		for (var i = 0; i < ds_list_size(altarList); i++) {
			if (instMap[? "object"] == altarList[| i]) {
				hp = instMap[? "hp"];
				isBreak = true;
				break;
			}
		}
		
		if (isBreak) {
			break;
		}
		#endregion
		#region obj_parent_item
		var itemList = global.objParentMap[? obj_parent_item];
		
		for (var i = 0; i < ds_list_size(itemList); i++) {
			if (instMap[? "object"] == itemList[| i]) {
				isSold = instMap[? "isSold"];
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