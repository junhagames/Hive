/// @description 저장 파일 생성
/// @param fileName

var fileName = argument0;

var _buffer = buffer_load("save.sav");
var _string = buffer_read(_buffer, buffer_string);
buffer_delete(_buffer);

return json_decode(_string);