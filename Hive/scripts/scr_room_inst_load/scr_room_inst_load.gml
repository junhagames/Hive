/// @description 룸 메모리 불러오기

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

for (var i = 0; i < ds_map_size(instMap); i++) {
	var _instMap = instMap[? i];
	
	with (_instMap[? "id"]) {
		hp = _instMap[? "hp"];
	}
}