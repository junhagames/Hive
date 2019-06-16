if (textPos < string_length(text)) {
    do {
        textPos += 1;
        alarm[0] = textSpeed;
    }
    until(string_char_at(text, textPos) != " " && string_char_at(text, textPos) != "#")
}