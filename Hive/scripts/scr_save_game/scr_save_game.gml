/// @description 게임 저장
/// @param fileName

var fileName = argument0;

var _chrMap = ds_map_create();
ds_map_copy(_chrMap, global.chrMap);

var saveMap = ds_map_create();
ds_map_add_map(saveMap, "chrMap", _chrMap);
ds_map_add(saveMap, "currentIndex", global.currentIndex);

var saveString = json_encode(saveMap);
var saveBuffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
buffer_write(saveBuffer, buffer_string, saveString);
buffer_save(saveBuffer, fileName);

ds_map_destroy(_chrMap);
ds_map_destroy(saveMap);
buffer_delete(saveBuffer);