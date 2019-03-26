/// @description 게임 초기화

#macro WALL "#"

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

enum POS {
	TOP,
	RIGHT,
	BOTTOM,
	LEFT,
	
	TOP_LEFT = "TOP_LEFT",
	TOP_RIGHT = "TOP_RIGHT",
	
	RIGHT_TOP = "RIGHT_TOP",
	RIGHT_BOTTOM = "RIGHT_BOTTOM",
	
	BOTTOM_RIGHT = "BOTTOM_RIGHT",
	BOTTOM_LEFT = "BOTTOM_LEFT",
	
	LEFT_BOTTOM = "LEFT_BOTTOM",
	LEFT_TOP = "LEFT_TOP",
	
}

enum MARK {
	INFO,
	ENTRY_POS,
	ENTRY_OBJECT,
	HIVE_OBJECT,
}

global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

randomize();

draw_set_font(font_main);