/// @description 룸 이동
/// @param index
/// @param pos

var index = argument0;
var pos = argument1;

var worldIndex = global.worldList[| index];
var infoMap = worldIndex[| MARK.INFO];

if (pos != noone) {
	global.previousPos = pos;
	instance_create_layer(0, 0, "layer_system", obj_transition_slide);
}
room_goto(infoMap[? "room"]);