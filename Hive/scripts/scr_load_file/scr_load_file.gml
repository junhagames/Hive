/// @description 세이브 파일 불러오기
/// @param fileName

var fileName = argument0;

var loadBuffer = buffer_load(fileName);
var loadString = buffer_read(loadBuffer, buffer_string);
buffer_delete(loadBuffer);

var saveJson = json_decode(loadString);

// 월드 불러오기
ds_grid_read(global.worldGrid, saveJson[? "worldGrid"]);
global.currentWorld = saveJson[? "currentWorld"];
global.currentIndex = saveJson[? "currentIndex"];
global.previousIndex = saveJson[? "previousIndex"];
global.previousPos = saveJson[? "previousPos"];
global.isBossClear = saveJson[? "isBossClear"];
global.time = saveJson[? "time"];

// 룸 불러오기
var roomJson = saveJson[? "roomMap"];
ds_map_clear(global.roomMap);

for (var i = 0; i < ds_map_size(roomJson); i++) {
	var _roomJson = roomJson[? string(i)];

	ds_map_add_map(global.roomMap, i, ds_map_create());
	var _roomMap =  global.roomMap[? i];

	ds_map_add_map(_roomMap, "info", ds_map_create());
	ds_map_add_map(_roomMap, "entry", ds_map_create());
	ds_map_add_map(_roomMap, "inst", ds_map_create());
	var infoMap = _roomMap[? "info"];
	var entryMap = _roomMap[? "entry"];
	var instMap = _roomMap[? "inst"];

	// 룸 정보 불러오기
	var infoJson = _roomJson[? "info"];
	infoMap[? "shape"] = infoJson[? "shape"];
	infoMap[? "event"] = infoJson[? "event"];
	infoMap[? "search"] = infoJson[? "search"];
	infoMap[? "room"] = infoJson[? "room"];

	// 룸 입구 정보 불러오기
	var entryJson = _roomJson[? "entry"];

	for (var j = 0; j < ds_map_size(entryJson); j++) {
		ds_map_add_map(entryMap, j, ds_map_create());	
		var _entryMap = entryMap[? j];
		var _entryJson = entryJson[? string(j)];
		_entryMap[? "targetIndex"] = _entryJson[? "targetIndex"];
		_entryMap[? "pos"] = _entryJson[? "pos"];
	}

	// 룸 인스턴스 정보 불러오기
	var instJson = _roomJson[? "inst"];

	for (var j = 0; j < ds_map_size(instJson); j++) {
		ds_map_add_map(instMap, j, ds_map_create());
		var _instMap = instMap[? j];
		var _instJson = instJson[? string(j)];
		
		_instMap[? "index"] = _instJson[? "index"];
		_instMap[? "id"] = _instJson[? "id"];
		_instMap[? "object"] = _instJson[? "object"];
		
		switch (_instJson[? "object"]) {
			#region obj_solid_rock
			case obj_solid_rock:
				_instMap[? "hp"] = _instJson[? "hp"];
				break;
			#endregion
			#region obj_chest
			case obj_chest:
				_instMap[? "isUse"] = _instJson[? "isUse"];
				break;
			#endregion
			#region obj_supply
			case obj_supply:
				_instMap[? "isUse"] = _instJson[? "isUse"];
				break;
			#endregion
			#region default
			default:
				var isBreak = false;
				#region obj_parent_enemy
				var enemyList = global.objParentMap[? obj_parent_enemy];
			
				for (var k = 0; k < ds_list_size(enemyList); k++) {
					if (_instMap[? "object"] == enemyList[| k]) {
						_instMap[? "hp"] = _instJson[? "hp"];
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
			
				for (var k = 0; k < ds_list_size(altarList); k++) {
					if (_instMap[? "object"] == altarList[| k]) {
						_instMap[? "hp"] = _instJson[? "hp"];
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
				
				for (var k = 0; k < ds_list_size(itemList); k++) {
					if (_instMap[? "object"] == itemList[| k]) {
						_instMap[? "isSold"] = _instJson[? "isSold"];
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
	}
}

// 캐릭터 정보 불러오기
var _chrMap = saveJson[? "chrMap"];
global.chrMap[? "class"] = _chrMap[? "class"];
global.chrMap[? "hpMax"] = _chrMap[? "hpMax"];
global.chrMap[? "power"] = _chrMap[? "power"];
global.chrMap[? "armor"] = _chrMap[? "armor"];
global.chrMap[? "moveSpeed"] = _chrMap[? "moveSpeed"];
global.chrMap[? "skillSpeed"] = _chrMap[? "skillSpeed"];
global.chrMap[? "rangerWeapon"] = _chrMap[? "rangerWeapon"];
global.chrMap[? "rangerDamage"] = _chrMap[? "rangerDamage"];
global.chrMap[? "rangerSpeed"] = _chrMap[? "rangerSpeed"];
global.chrMap[? "rangerAccuracy"] = _chrMap[? "rangerAccuracy"];
global.chrMap[? "ammoMax"] = _chrMap[? "ammoMax"];
global.chrMap[? "warriorWeapon"] = _chrMap[? "warriorWeapon"];
global.chrMap[? "warriorDamage"] = _chrMap[? "warriorDamage"];
global.chrMap[? "warriorSpeed"] = _chrMap[? "warriorSpeed"];

global.chrMap[? "hp"] = _chrMap[? "hp"];
global.chrMap[? "ammo"] = _chrMap[? "ammo"];
global.chrMap[? "coin"] = _chrMap[? "coin"];
global.chrMap[? "oddments"] = _chrMap[? "oddments"];
global.chrMap[? "part"] = _chrMap[? "part"];
global.chrMap[? "swap"] = _chrMap[? "swap"];