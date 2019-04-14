// Goto next room
var worldIndex = global.worldList[| global.currentIndex];
var infoMap = worldIndex[| MARK.INFO];
global.previousIndex = infoMap[? "index"];
global.currentIndex = other.targetIndex;
scr_world_room_goto(global.currentIndex, other.pos);

instance_create_layer(0, 0, "layer_system", obj_transition_slide);