/// @description 저장 파일 생성
/// @param fileName

var fileName = argument0;

var saveString = json_encode(global.saveMap);
var saveBuffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
buffer_write(saveBuffer, buffer_string, saveString);
buffer_save(saveBuffer, fileName);
buffer_delete(saveBuffer);