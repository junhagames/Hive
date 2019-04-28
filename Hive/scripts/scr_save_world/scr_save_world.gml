/// @description 게임 월드 저장

global.saveMap[? "worldData"] = ds_grid_write(global.worldGrid);

scr_save_file("save.sav");