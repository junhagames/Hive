// Goto next room
if (other.isOpen) {
	global.previousIndex = global.currentIndex;
	global.currentIndex = other.targetIndex;
	global.previousPos = other.pos;
	
	instance_create_layer(0, 0, "layer_system", obj_transition_slide);
	scr_world_room_goto(global.currentIndex);
}