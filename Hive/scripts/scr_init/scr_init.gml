/// @description 게임 초기화

#region 메크로 상수
#macro WALL "#"
#macro CELL_WIDTH 40
#macro CELL_HEIGHT 40
#endregion
#region 알람 열거형
enum ALARM_CHR {
	ATTACK,
	SKILL,
	DAMAGE,
	SWAP,
	DASH,
}

enum ALARM_INSECT {
	MOVE,
}

enum ALARM_HIVE {
	SPAWN,
}
#endregion
#region 게임 설정|데이터 불러오기
ini_open("game.ini");

if (!file_exists("game.ini")) {
	// 볼륨 초기화
	ini_write_real("settings", "bgmVolume", 1);
	ini_write_real("settings", "sfxVolume", 1);

	// 화면 초기화
	ini_write_real("screen", "gameWidth", 1280);
	ini_write_real("screen", "gameHeight", 720);
	ini_write_real("screen", "zoom", 1);
	ini_write_real("screen", "resolution", 1);
}

// 볼륨 불러오기
global.bgmVolume = ini_read_real("settings", "bgmVolume", 1);
global.sfxVolume = ini_read_real("settings", "sfxVolume", 1);

// 화면 불러오기
global.gameWidth = ini_read_real("screen", "gameWidth", 1280);
global.gameHeight = ini_read_real("screen", "gameHeight", 720);
global.zoom = ini_read_real("screen", "zoom", 1);
global.resolution = ini_read_real("screen", "resolution", 1);
ini_close();
#endregion

// 월드 초기화
global.worldGrid = ds_grid_create(0, 0);
global.roomMap = ds_map_create();
global.currentWorld = "city";
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;
global.isClear = false;

// 캐릭터 초기화
global.chrMap = ds_map_create();
global.chrMap[? "coin"] = 0;
global.chrMap[? "class"] = "worker";
global.chrMap[? "hpMax"] = 100;
global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
global.chrMap[? "power"] = 1;
global.chrMap[? "armor"] = 1;
global.chrMap[? "speed"] = 6;
global.chrMap[? "swap"] = "ranger";
global.chrMap[? "ammoMax"] = 20;
global.chrMap[? "ammo"] = global.chrMap[? "ammoMax"];
global.chrMap[? "rangerWeapon"] = "pistol";
global.chrMap[? "rangerDamage"] = 2;
global.chrMap[? "rangerSpeed"] = room_speed * 0.13;
global.chrMap[? "rangerAccuracy"] = 4;
global.chrMap[? "warriorWeapon"] = "bat";
global.chrMap[? "warriorDamage"] = 8;
global.chrMap[? "warriorSpeed"] = room_speed * 0.3;

// 저장 구조체 초기화
global.saveMap = ds_map_create();
ds_map_add_map(global.saveMap, "roomMap", global.roomMap);
ds_map_add_map(global.saveMap, "chrMap", global.chrMap);

// 오브젝트 부모 계층 초기화
global.objParentMap = ds_map_create();

for (var obj = 0; object_exists(obj); obj++) {
	for (var objParent = object_get_parent(obj); object_exists(objParent); objParent = object_get_parent(objParent)) {
		if (!ds_map_exists(global.objParentMap, objParent)) {
			ds_map_add_list(global.objParentMap, objParent, ds_list_create());
		}
		ds_list_add(global.objParentMap[? objParent], obj);
	}
}

// 룸 부모 계층 초기화
global.roomParentMap = ds_map_create();
var roomParent = noone;

for (var _room = 0; room_exists(_room); _room++) {
	var roomName = room_get_name(_room);
	
	if (roomName == "room_parent_city_small" ||
		roomName == "room_parent_city_big" ||
		roomName == "room_parent_city_wlong" ||
		roomName == "room_parent_city_hlong" ||
		roomName == "room_parent_city_boss" ||
		roomName == "room_parent_city_miniboss" ||
		roomName == "room_parent_city_supply" ||
		roomName == "room_parent_city_shop" ||
		roomName == "room_parent_city_encounter" ||
		
		roomName == "room_parent_swamp_small" ||
		roomName == "room_parent_swamp_big" ||
		roomName == "room_parent_swamp_wlong" ||
		roomName == "room_parent_swamp_hlong" ||
		roomName == "room_parent_swamp_boss" ||
		roomName == "room_parent_swamp_miniboss" ||
		roomName == "room_parent_swamp_supply" ||
		roomName == "room_parent_swamp_shop" ||
		roomName == "room_parent_swamp_encounter" ||
		
		roomName == "room_parent_underground_small" ||
		roomName == "room_parent_underground_big" ||
		roomName == "room_parent_underground_wlong" ||
		roomName == "room_parent_underground_hlong" ||
		roomName == "room_parent_underground_boss" ||
		roomName == "room_parent_underground_miniboss" ||
		roomName == "room_parent_underground_supply" ||
		roomName == "room_parent_underground_shop" ||
		roomName == "room_parent_underground_encounter" ||
		
		roomName == "room_parent_jungle_small" ||
		roomName == "room_parent_jungle_big" ||
		roomName == "room_parent_jungle_wlong" ||
		roomName == "room_parent_jungle_hlong" ||
		roomName == "room_parent_jungle_boss" ||
		roomName == "room_parent_jungle_miniboss" ||
		roomName == "room_parent_jungle_supply" ||
		roomName == "room_parent_jungle_shop" ||
		roomName == "room_parent_jungle_encounter" ||
		
		roomName == "room_parent_desert_small" ||
		roomName == "room_parent_desert_big" ||
		roomName == "room_parent_desert_wlong" ||
		roomName == "room_parent_desert_hlong" ||
		roomName == "room_parent_desert_boss" ||
		roomName == "room_parent_desert_miniboss" ||
		roomName == "room_parent_desert_supply" ||
		roomName == "room_parent_desert_shop" ||
		roomName == "room_parent_desert_encounter" ||
		
		roomName == "room_parent_school_small" ||
		roomName == "room_parent_school_big" ||
		roomName == "room_parent_school_wlong" ||
		roomName == "room_parent_school_hlong" ||
		roomName == "room_parent_school_boss" ||
		roomName == "room_parent_school_miniboss" ||
		roomName == "room_parent_school_supply" ||
		roomName == "room_parent_school_shop" ||
		roomName == "room_parent_school_encounter") {
		roomParent = _room;
		ds_map_add_list(global.roomParentMap, roomParent, ds_list_create());
	}
	else if (roomParent != noone) {
		ds_list_add(global.roomParentMap[? roomParent], _room);
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

// 크로스헤어 초기화
cursor_sprite = spr_ui_crosshair_ranger;