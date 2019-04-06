/// @description 게임 초기화

#macro WALL "#"

#macro SMALL_WIDTH 1280
#macro SMALL_HEIGHT 720

#macro BIG_WIDTH 2560
#macro BIG_HEIGHT 1440

#macro WLONG_WIDTH 2560
#macro WLONG_HEIGHT 720

#macro HLONG_WIDTH 1280
#macro HLONG_HEIGHT 1440

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
	
	TOP_LEFT,
	TOP_RIGHT,
	
	RIGHT_TOP,
	RIGHT_BOTTOM,
	
	BOTTOM_RIGHT,
	BOTTOM_LEFT,
	
	LEFT_BOTTOM,
	LEFT_TOP,
}

enum MARK {
	INFO,
	ENTRY,
	HIVE,
}

enum SEARCH {
	UNKNOWN,
	CLOSE,
	KNOWN,
}

global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

global.worldGrid = ds_grid_create(15, 15);
global.worldList = ds_list_create();
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;

randomize();

draw_set_font(font_main);