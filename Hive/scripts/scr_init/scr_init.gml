/// @description 게임 초기화

#region 메크로 상수
#macro VERSION "0.1"
#macro SAVE_FILE "save.sav"
#macro WALL -1
#macro CELL_WIDTH 40
#macro CELL_HEIGHT 40
#endregion
#region 열거형
enum VSTICK {
	MOVE,
}

enum VKEY {
	ATTACK,
	SKILL,
	SWAP,
	DASH,
	MINIMAP,
}

enum VSTICK_SETTING {
	DEVICE_ID,
	CENTER_X,
	CENTER_Y,
	X,
	Y,
	RADIUS,
	DISTANCE,
	X_AXIS,
	Y_AXIS,
	DIRECTION,
	CHECK,
	PRESSED,
	RELEASED,
	DRAW_X,
	DRAW_Y,
	BACK_SPRITE,
	FRONT_SPRITE,
}

enum VKEY_SETTING {
	DEVICE_ID,
	X,
	Y,
	RADIUS,
	CHECK,
	PRESSED,
	RELEASED,
	SPRITE,
}

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

enum ALARM_VFX {
	HIT = 11,
}
#endregion
#region 게임 설정|데이터 불러오기
ini_open("game.ini");

if (!file_exists("game.ini")) {
	// 사운드 볼륨 초기화
	ini_write_real("settings", "bgmVolume", 1);
	ini_write_real("settings", "sfxVolume", 1);

	// 화면 초기화
	ini_write_real("screen", "gameWidth", 1280);
	ini_write_real("screen", "gameHeight", 720);
}

// 사운드 관련 불러오기
global.bgmVolume = ini_read_real("settings", "bgmVolume", 1);
global.sfxVolume = ini_read_real("settings", "sfxVolume", 1);
global.bgmPlaying = bgm_title;
audio_group_load(audiogroup_bgm);
audio_group_load(audiogroup_sfx);

// 화면 불러오기
global.gameWidth = ini_read_real("screen", "gameWidth", 1280);
global.gameHeight = ini_read_real("screen", "gameHeight", 720);
ini_close();
#endregion
#region 오브젝트 부모 계층 초기화
global.objParentMap = ds_map_create();

for (var obj = 0; object_exists(obj); obj++) {
	for (var objParent = object_get_parent(obj); object_exists(objParent); objParent = object_get_parent(objParent)) {
		if (!ds_map_exists(global.objParentMap, objParent)) {
			ds_map_add_list(global.objParentMap, objParent, ds_list_create());
		}
		ds_list_add(global.objParentMap[? objParent], obj);
	}
}
#endregion
#region 룸 부모 계층 초기화
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
		roomName == "room_parent_city_potionshop" ||
		roomName == "room_parent_city_weaponshop" ||
		roomName == "room_parent_city_encounter" ||
		
		roomName == "room_parent_swamp_small" ||
		roomName == "room_parent_swamp_big" ||
		roomName == "room_parent_swamp_wlong" ||
		roomName == "room_parent_swamp_hlong" ||
		roomName == "room_parent_swamp_boss" ||
		roomName == "room_parent_swamp_miniboss" ||
		roomName == "room_parent_swamp_supply" ||
		roomName == "room_parent_swamp_potionshop" ||
		roomName == "room_parent_swamp_weaponshop" ||
		roomName == "room_parent_swamp_encounter" ||
		
		roomName == "room_parent_underground_small" ||
		roomName == "room_parent_underground_big" ||
		roomName == "room_parent_underground_wlong" ||
		roomName == "room_parent_underground_hlong" ||
		roomName == "room_parent_underground_boss" ||
		roomName == "room_parent_underground_miniboss" ||
		roomName == "room_parent_underground_supply" ||
		roomName == "room_parent_underground_potionshop" ||
		roomName == "room_parent_underground_weaponshop" ||
		roomName == "room_parent_underground_encounter" ||
		
		roomName == "room_parent_jungle_small" ||
		roomName == "room_parent_jungle_big" ||
		roomName == "room_parent_jungle_wlong" ||
		roomName == "room_parent_jungle_hlong" ||
		roomName == "room_parent_jungle_boss" ||
		roomName == "room_parent_jungle_miniboss" ||
		roomName == "room_parent_jungle_supply" ||
		roomName == "room_parent_jungle_potionshop" ||
		roomName == "room_parent_jungle_weaponshop" ||
		roomName == "room_parent_jungle_encounter" ||
		
		roomName == "room_parent_desert_small" ||
		roomName == "room_parent_desert_big" ||
		roomName == "room_parent_desert_wlong" ||
		roomName == "room_parent_desert_hlong" ||
		roomName == "room_parent_desert_boss" ||
		roomName == "room_parent_desert_miniboss" ||
		roomName == "room_parent_desert_supply" ||
		roomName == "room_parent_desert_potionshop" ||
		roomName == "room_parent_desert_weaponshop" ||
		roomName == "room_parent_desert_encounter" ||
		
		roomName == "room_parent_school_small" ||
		roomName == "room_parent_school_big" ||
		roomName == "room_parent_school_wlong" ||
		roomName == "room_parent_school_hlong" ||
		roomName == "room_parent_school_boss" ||
		roomName == "room_parent_school_miniboss" ||
		roomName == "room_parent_school_supply" ||
		roomName == "room_parent_school_potionshop" ||
		roomName == "room_parent_school_weaponshop" ||
		roomName == "room_parent_school_encounter") {
		roomParent = _room;
		ds_map_add_list(global.roomParentMap, roomParent, ds_list_create());
	}
	else if (roomParent != noone) {
		ds_list_add(global.roomParentMap[? roomParent], _room);
	}
}
#endregion

// 게임 설정 초기화
global.worldGrid = ds_grid_create(0, 0);
global.roomMap = ds_map_create();
global.chrMap = ds_map_create();

// 저장 구조체 초기화
global.saveMap = ds_map_create();
ds_map_add_map(global.saveMap, "roomMap", global.roomMap);
ds_map_add_map(global.saveMap, "chrMap", global.chrMap);

// 시드값 초기화
randomize();

// 폰트 초기화
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 화면 크기|해상도 초기화
window_set_size(global.gameWidth, global.gameHeight);
display_set_gui_size(global.gameWidth, global.gameHeight);
surface_resize(application_surface, global.gameWidth, global.gameHeight);

if (os_type == os_windows) {
	global.cameraWidth = 1280;
	global.cameraHeight = 720;
}
else if (os_type == os_android) {
	global.cameraWidth = 960;
	global.cameraHeight = 540;
}

// 더블 좌클릭시 우클릭 방지
device_mouse_dbclick_enable(false);