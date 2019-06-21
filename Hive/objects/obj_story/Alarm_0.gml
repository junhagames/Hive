/// @description 텍스트 진행

if (textPos < string_length(text)) {
    do {
        textPos += 1;
        alarm[ALARM_STORY.TEXT] = textSpeed;
    }
    until (string_char_at(text, textPos) != " " && string_char_at(text, textPos) != "#")
}