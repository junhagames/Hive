// Goto next room
var worldIndex = global.worldList[| global.currentIndex];
var infoMap = worldIndex[| MARK.INFO];
global.previousIndex = infoMap[? "index"];
global.currentIndex = other.target_roomId;
scr_world_room_goto(global.currentIndex, other.pos);