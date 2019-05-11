/// @description 세이브 파일 JSON으로 불러오기
/// @param fileName

var fileName = argument0;

var loadBuffer = buffer_load(fileName);
var loadString = buffer_read(loadBuffer, buffer_string);
buffer_delete(loadBuffer);

var saveJson = json_decode(loadString);

// 월드 불러오기
ds_grid_read(global.worldGrid, saveJson[? "worldGrid"]);
global.saveMap[? "worldGrid"] = ds_grid_write(global.worldGrid);

global.currentWorld = saveJson[? "currentWorld"];
global.saveMap[? "currentWorld"] = global.currentWorld;

// 룸 불러오기
var roomJson = saveJson[? "roomMap"];

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
		
		_instMap[? "id"] = _instJson[? "id"];
		_instMap[? "object"] = _instJson[? "object"];
			
		if (_instMap[? "object"] == obj_solid_rock) {
			// obj_solid_rock
			_instMap[? "hp"] = _instJson[? "hp"];
		}
		else {
			// obj_parent_enemy
			var enemyList = global.objParentMap[? obj_parent_enemy];

			for (var k = 0; k < ds_list_size(enemyList); k++) {
				if (_instMap[? "object"] == enemyList[| k]) {
					_instMap[? "hp"] = _instJson[? "hp"];
				}
			}
		}
	}
}

// 캐릭터 정보 불러오기
global.chrMap = saveJson[? "chrMap"];