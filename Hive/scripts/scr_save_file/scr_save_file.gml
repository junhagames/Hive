/// @description 게임 세이브
/// @param fileName

var fileName = argument0;

// 월드 세이브
global.saveMap[? "worldGrid"] = ds_grid_write(global.worldGrid);
global.saveMap[? "currentWorld"] = global.currentWorld;
global.saveMap[? "currentIndex"] = global.currentIndex;
global.saveMap[? "previousIndex"] = global.previousIndex;
global.saveMap[? "previousPos"] = global.previousPos;
global.saveMap[? "isBossClear"] = global.isBossClear;
global.saveMap[? "time"] = global.time;

// 세이브 파일 생성
var saveString = json_encode(global.saveMap);
var saveBuffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
buffer_write(saveBuffer, buffer_string, saveString);
buffer_save(saveBuffer, fileName);
buffer_delete(saveBuffer);