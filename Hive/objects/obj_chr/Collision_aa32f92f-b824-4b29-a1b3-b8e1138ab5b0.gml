// Goto next room
if (other.isOpen) {
	var worldIndex = global.worldList[| global.currentIndex];
	var infoMap = worldIndex[| MARK.INFO];
	global.previousIndex = infoMap[? "index"];
	global.currentIndex = other.targetIndex;
	scr_world_room_goto(global.currentIndex, other.pos);
}