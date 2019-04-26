/// @description 게임 초기화

#region Macro
#macro WALL "#"
#macro CELL_WIDTH 40
#macro CELL_HEIGHT 40
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
	MINIBOSS,
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

enum ALARM_HIVE {
	SPAWN,
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

global.hierarchy = ds_map_create();

// Add object
var objectIndex;

for (objectIndex = 0; object_exists(objectIndex); objectIndex++) {
	if (!ds_map_exists(global.hierarchy, objectIndex)){
		ds_map_add_list(global.hierarchy, objectIndex, ds_list_create());
	}
	var parent = object_get_parent(objectIndex);
	
	if (object_exists(parent)) {
		if (!ds_map_exists(global.hierarchy, parent)) {
			ds_map_add_list(global.hierarchy, parent, ds_list_create());
		}
		ds_list_add(global.hierarchy[? parent], objectIndex);
		
		for (var super = object_get_parent(parent); object_exists(super); super = object_get_parent(super)) {
			if (!ds_map_exists(global.hierarchy, super)) {
				ds_map_add_list(global.hierarchy, super, ds_list_create());
			}
			ds_list_add(global.hierarchy[? super], objectIndex);
		}
	}
}

// Add parse room
//for (var i = 0; i < 4; i++) {
//	ds_map_add_list(global.hierarchy, objectIndex + i, ds_list_create());
	
//	for (var roomIndex = 0; room_exists(roomIndex); roomIndex++) {
//		room_exists()
//		string_copy(room_get_name(room_stage_small1), 12, 15)
	
//		if (object_exists(parent)) {
//			if (!ds_map_exists(global.hierarchy, parent)) {
//				ds_map_add_list(global.hierarchy, parent, ds_list_create());
//			}
//			ds_list_add(global.hierarchy[? parent], roomIndex);
		
//			for (var super = object_get_parent(parent); object_exists(super); super = object_get_parent(super)) {
//				if (!ds_map_exists(global.hierarchy, super)) {
//					ds_map_add_list(global.hierarchy, super, ds_list_create());
//				}
//				ds_list_add(global.hierarchy[? super], roomIndex);
//			}
//		}
//	}
//}

//var childList = global.hierarchy[? room_parent_stage_small];
//for (var i = 0; i < ds_list_size(childList); i++) {
//	show_debug_message(childList[| i]);
//}
//show_message();
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
