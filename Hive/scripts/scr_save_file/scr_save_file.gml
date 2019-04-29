/// @description 게임 세이브
/// @param fileName

var fileName = argument0;

// 현재 위치 세이브
global.saveMap[? "currentIndex"] = global.currentIndex;

// 세이브 파일 생성
var saveString = json_encode(global.saveMap);
var saveBuffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
buffer_write(saveBuffer, buffer_string, saveString);
buffer_save(saveBuffer, fileName);
buffer_delete(saveBuffer);