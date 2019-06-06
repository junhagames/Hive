/// @description 인스턴스 정보 저장

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

for (var i = 0; i < ds_map_size(instMap); i++) {
	var _instMap = instMap[? i];

	with (_instMap[? "id"]) {
		scr_inst_map_save(_instMap);
	}
}