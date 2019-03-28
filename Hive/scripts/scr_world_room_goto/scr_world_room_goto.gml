/// @description 룸 이동
/// @param roomIndex
/// @param pos

var roomIndex = argument0;
var pos = argument1;

var worldIndex = global.worldList[| roomIndex];
var infoMap = worldIndex[| MARK.INFO];

if (pos != noone) {
	global.previousPos = pos;
}

room_goto(infoMap[? "room"]);