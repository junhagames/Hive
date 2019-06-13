// 룸 이동
if (other.isOpen) {
	var _roomMap = global.roomMap[? global.currentIndex];
	var instMap = _roomMap[? "inst"];

	for (var i = 0; i < ds_map_size(instMap); i++) {
		var _instMap = instMap[? i];

		with (_instMap[? "id"]) {
			scr_inst_map_save(_instMap);
		}
	}
	global.previousIndex = global.currentIndex;
	global.currentIndex = other.targetIndex;
	global.previousPos = other.pos;
	scr_transition_slide();
	room_goto(scr_world_room_index(global.currentIndex));
}