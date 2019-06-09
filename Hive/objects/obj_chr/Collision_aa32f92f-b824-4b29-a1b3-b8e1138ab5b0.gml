// 룸 이동
if (other.isOpen) {
	scr_room_inst_save();
	
	global.previousIndex = global.currentIndex;
	global.currentIndex = other.targetIndex;
	global.previousPos = other.pos;
	scr_transition_slide();
	room_goto(scr_world_room_index(global.currentIndex));
}