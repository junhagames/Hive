/// @description 게임 초기화

#region Macro
#macro WALL "#"
#macro SMALL_WIDTH 1280
#macro SMALL_HEIGHT 720
#macro BIG_WIDTH 2560
#macro BIG_HEIGHT 1440
#macro WLONG_WIDTH 2560
#macro WLONG_HEIGHT 720
#macro HLONG_WIDTH 1280
#macro HLONG_HEIGHT 1440
#endregion
#region Enum
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

enum SWAP {
	RANGER,
	WARRIOR,
}
#endregion
#region Global
global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

global.worldGrid = ds_grid_create(15, 15);
global.worldList = ds_list_create();
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;

global.chrStatus = ds_map_create();
global.chrStatus[? "hpMax"] = 20;
global.chrStatus[? "hp"] = global.chrStatus[? "hpMax"];
global.chrStatus[? "strength"] = 1;
global.chrStatus[? "armor"] = 1;
global.chrStatus[? "speed"] = 6;
global.chrStatus[? "dodge"] = 1;
global.chrStatus[? "swap"] = SWAP.RANGER;
global.chrStatus[? "rangerAmmoMax"] = 30;
global.chrStatus[? "rangerAmmo"] = global.chrStatus[? "rangerAmmoMax"];
global.chrStatus[? "rangerDamage"] = 3;
global.chrStatus[? "rangerSpeed"] = room_speed * 0.1;
global.chrStatus[? "rangerAccuracy"] = 8;
global.chrStatus[? "warriorDamage"] = 10;
global.chrStatus[? "warriorSpeed"] = room_speed * 1;
#endregion

randomize();

draw_set_font(font_main);