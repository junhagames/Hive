/// @description 텍스트 진행

if (textPos < string_length(text)) {
    do {
        textPos += 1;
        alarm[ALARM_STORY.TEXT] = textSpeed;
		var sfx = audio_play_sound(sfx_story_text, 10, false);
		audio_sound_pitch(sfx, random_range(0.8, 1.2));
    }
    until (string_char_at(text, textPos) != " " && string_char_at(text, textPos) != "#")
}