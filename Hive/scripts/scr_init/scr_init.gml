/// @description 게임 초기화

#region Macro
#macro WALL "#"
#macro CELL_WIDTH sprite_get_width(spr_block)
#macro CELL_HEIGHT sprite_get_height(spr_block)
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
	INST,
}

enum SEARCH {
	KNOWN,
	CLOSE,
	UNKNOWN,
}

enum EVENT {
	STAGE,
	BOSS,
	SUPPLY,
	SHOP,
	QUEST,
	
}

enum SWAP {
	RANGER,
	WARRIOR,
}

enum ALARM_CHR {
	ATTACK,
	SKILL,
	DAMAGE,
	SWAP,
	RELOAD,
}

enum ALARM_INSECT {
	MOVE,
}
#endregion
#region Global
global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

global.worldGrid = ds_grid_create(7, 7);
global.worldList = ds_list_create();
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;

global.chrMap = ds_map_create();
global.chrMap[? "hpMax"] = 100;
global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
global.chrMap[? "coin"] = 0;
global.chrMap[? "strength"] = 1;
global.chrMap[? "armor"] = 1;
global.chrMap[? "speed"] = 6;
global.chrMap[? "swap"] = SWAP.RANGER;
global.chrMap[? "ammoMax"] = 30;
global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
global.chrMap[? "rangerDamage"] = 2;
global.chrMap[? "rangerSpeed"] = room_speed * 0.1;
global.chrMap[? "rangerAccuracy"] = 10;
global.chrMap[? "warriorDamage"] = 8;
global.chrMap[? "warriorSpeed"] = room_speed * 0.4;
#endregion

randomize();

// Font
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Screen
window_set_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
display_set_gui_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
	
cursor_sprite = spr_ui_cursor;
