if (mouse_check_button_pressed(mb_left) && textPos == string_length(text)) {
	var targetRoom;
	
	switch (global.currentWorld) {
		case "city":
			targetRoom = room_city_start;
			break;
		case "swamp":
			targetRoom = room_swamp_start;
			break;
		case "underground":
			targetRoom = room_underground_start;
			break;
		case "jungle":
			targetRoom = room_jungle_start;
			break;
		case "desert":
			targetRoom = room_desert_start;
			break;
		case "school":
			targetRoom = room_school_start;
			break;	
	}
	scr_transition_fadeout(targetRoom);
}

if (mouse_check_button(mb_left)) {
    textSpeed = textSpeedMax / 3;
}
else {
    textSpeed = textSpeedMax;
}