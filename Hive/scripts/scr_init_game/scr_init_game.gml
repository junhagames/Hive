/// @description 게임 초기화

global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

enum DIR {
	EAST,
	WEST,
	SOUTH,
	NORTH,
}

enum SHAPE {
	SMALL,
	BIG,
	WLONG,
	HLONG,
}

enum MARK {
	ENTRY,
	OBJECT,
}

randomize();

draw_set_font(font_main);