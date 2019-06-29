if (textPos == string_length(text) || skipPos >= skipPosMax) {
	if ((mouse_check_button_pressed(mb_left) || skipPos >= skipPosMax) && !instance_exists(obj_transition_fadeout)) {
		var targetRoom;
	
		if (global.currentWorld == "school") {
			targetRoom = room_school_start;	
		}
		scr_transition_fadeout(targetRoom);
		audio_play_sound(sfx_button_click, 10, false);
	}
	continueAlpha = (continueAlpha + 1) mod 360;
}

if (mouse_check_button(mb_left)) {
	if (skipPos < skipPosMax) {
		skipPos++;
	}
}
else {
	skipPos = 0;
}
skipAlpha = skipPos / skipPosMax;