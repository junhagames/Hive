/// @description 인스턴스 정보 저장
/// @param index

var index = argument0;

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];
var _instMap = instMap[? index];

if (_instMap[? "hp"] > 0) {
	with (_instMap[? "id"]) {
		scr_inst_map_save(_instMap);
	}
}