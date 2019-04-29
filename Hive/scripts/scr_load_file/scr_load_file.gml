/// @description 세이브 파일 JSON으로 불러오기
/// @param fileName

var fileName = argument0;

var loadBuffer = buffer_load(fileName);
var loadString = buffer_read(loadBuffer, buffer_string);
buffer_delete(loadBuffer);

return json_decode(loadString);