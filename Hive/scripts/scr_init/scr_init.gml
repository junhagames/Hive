/// @description 게임 초기화
#region 메크로 상수
#macro WALL "#"
#macro CELL_WIDTH 40
#macro CELL_HEIGHT 40
#endregion
#region 열거형
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
	MEMORY,
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

enum ALARM_INSECT {
	MOVE,
}

enum ALARM_HIVE {
	SPAWN,
}
#endregion

// 화면 초기화
global.gameWidth = 1280;
global.gameHeight = 720;
global.zoom = 1;
global.resolution = 1;

// 월드 초기화
global.worldGrid = ds_grid_create(7, 7);
global.worldList = ds_list_create();
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;

// 캐릭터 초기화
global.chrMap = ds_map_create();
global.chrMap[? "hpMax"] = 100;
global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
global.chrMap[? "money"] = 0;
global.chrMap[? "power"] = 1;
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

// 오브젝트 부모 계층 초기화
global.objParentMap = ds_map_create();

for (var obj = 0; object_exists(obj); obj++) {
	for (var parent = object_get_parent(obj); object_exists(parent); parent = object_get_parent(parent)) {
		if (!ds_map_exists(global.objParentMap, parent)) {
			ds_map_add_list(global.objParentMap, parent, ds_list_create());
		}
		ds_list_add(global.objParentMap[? parent], obj);
	}
}

// 룸 부모 계층 초기화
global.roomParentMap = ds_map_create();
var parent = noone;

for (var rom = 0; room_exists(rom); rom++) {
	var roomName = room_get_name(rom);
	
	if (roomName == "room_parent_stage_small" ||
		roomName == "room_parent_stage_big" ||
		roomName == "room_parent_stage_wlong" ||
		roomName == "room_parent_stage_hlong") {
		parent = rom;
		ds_map_add_list(global.roomParentMap, parent, ds_list_create());
	}
	else if (parent != noone) {
		ds_list_add(global.roomParentMap[? parent], rom);
	}
}

// 시드값 초기화
randomize();

// 폰트 초기화
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 화면 크기|해상도 초기화
window_set_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);
display_set_gui_size(global.gameWidth * global.zoom, global.gameHeight * global.zoom);

// 마우스 커서 스프라이트 초기화
cursor_sprite = spr_ui_cursor;
