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

global.worldGrid = ds_grid_create(15, 15);
global.worldList = ds_list_create();
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;

global.chrStatus = ds_map_create();
global.chrStatus[? "hpMax"] = 2000;
global.chrStatus[? "hp"] = global.chrStatus[? "hpMax"];
global.chrStatus[? "money"] = 0;
global.chrStatus[? "strength"] = 1;
global.chrStatus[? "armor"] = 1;
global.chrStatus[? "speed"] = 6;
global.chrStatus[? "swap"] = SWAP.RANGER;
global.chrStatus[? "ammoMax"] = 30;
global.chrStatus[? "ammo"] = global.chrStatus[? "ammoMax"];
global.chrStatus[? "rangerDamage"] = 2;
global.chrStatus[? "rangerSpeed"] = room_speed * 0.1;
global.chrStatus[? "rangerAccuracy"] = 10;
global.chrStatus[? "warriorDamage"] = 8;
global.chrStatus[? "warriorSpeed"] = room_speed * 0.4;
#endregion

randomize();

draw_set_font(font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

cursor_sprite = spr_ui_cursor;