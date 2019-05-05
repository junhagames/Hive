/// @description 룸 메모리 파괴

var _roomMap = global.roomMap[? global.currentIndex];
var instMap = _roomMap[? "inst"];

for (var i = 0; i < ds_map_size(instMap); i++) {
	var _instMap = instMap[? i];
	
	if (id == _instMap[? "id"]) {
		_instMap[? "hp"] = 0;
		break;
	}
}