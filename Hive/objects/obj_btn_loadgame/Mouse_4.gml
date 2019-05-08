var fileName = "save.sav";

if (file_exists(fileName)) {
	scr_load_file(fileName);
	scr_world_room_goto(0);
}
else {
	show_message("세이브 파일이 존재하지 않습니다!");
}