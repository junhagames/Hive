/// @description 게임 초기화

global.gameWidth = 1024;
global.gameHeight = 768;
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

randomize();