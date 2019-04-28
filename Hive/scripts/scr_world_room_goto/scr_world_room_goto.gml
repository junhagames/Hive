/// @description 룸 이동
/// @param index

var index = argument0;

var worldIndex = global.roomList[| index];
var infoMap = worldIndex[| MARK.INFO];
room_goto(infoMap[? "room"]);