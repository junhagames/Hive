/// @description 룸 인덱스 반환
/// @param index

var index = argument0;

var _roomMap = global.roomMap[? index];
var infoMap = _roomMap[? "info"];
return infoMap[? "room"];