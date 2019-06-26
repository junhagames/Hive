if (other.isOpen) {
	// 게임 세이브
	var _roomMap = global.roomMap[? global.currentIndex];
	var instMap = _roomMap[? "inst"];

	for (var i = 0; i < ds_map_size(instMap); i++) {
		var _instMap = instMap[? i];

		with (_instMap[? "id"]) {
			scr_inst_map_save(_instMap);
		}
	}
	scr_save_file(SAVE_FILE);
	
	// 룸 이동
	global.previousIndex = global.currentIndex;
	global.currentIndex = other.targetIndex;
	global.previousPos = other.pos;
	scr_transition_slide();
	room_goto(scr_world_room_index(global.currentIndex));
}