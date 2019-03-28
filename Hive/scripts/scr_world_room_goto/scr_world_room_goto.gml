/// @description 룸 이동
/// @param roomIndex
/// @param pos

var roomIndex = argument0;
var pos = argument1;

if (pos != noone) {
	global.previousPos = pos;
}

var worldIndex = global.worldList[| roomIndex];
var infoMap = worldIndex[| MARK.INFO];
room_goto(infoMap[? "room"]);