/// @description 룸 이동
/// @param index

var index = argument0;

var _roomMap = global.roomMap[? index];
var infoMap = _roomMap[? "info"];
room_goto(infoMap[? "room"]);