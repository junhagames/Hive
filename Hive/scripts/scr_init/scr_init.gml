/// @description 게임 초기화

#region 메크로 상수
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
}

enum VSTICK_SETTING {
	DEVICE_ID,
	FIXED,
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
global.chrMap[? "upgradePart"] = 0;
global.chrMap[? "class"] = "commando";
global.chrMap[? "hpMax"] = 100;
global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
global.chrMap[? "power"] = 2;
global.chrMap[? "armor"] = 1;
global.chrMap[? "speed"] = 5;
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

// 더블 좌클릭시 우클릭 방지
device_mouse_dbclick_enable(false);

// 폰트 초기화
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 화면 크기|해상도 초기화
window_set_size(global.gameWidth, global.gameHeight);
//display_set_gui_maximise(0.75, 0.75, 0, 0);
display_set_gui_size(global.gameWidth, global.gameHeight);
surface_resize(application_surface, global.gameWidth, global.gameHeight);

// 마우스 커서 초기화
global.cursorSprite = spr_ui_cursor_action;

// 가상 조이스틱|키 초기화
if (os_type == os_android) {
}
scr_vstick_init(VSTICK.MOVE, false, 240, global.gameHeight - 180, sprite_get_width(spr_joystick_move_back) / 2, spr_joystick_move_back, spr_joystick_move_front);
scr_vkey_init(VKEY.ATTACK, global.gameWidth - 240, global.gameHeight - 180, sprite_get_width(spr_key_attack) / 2, spr_key_attack);
scr_vkey_init(VKEY.SKILL, global.gameWidth - 400, global.gameHeight - 70, sprite_get_width(spr_key_skill) / 2, spr_key_skill);
scr_vkey_init(VKEY.SWAP, global.gameWidth - 70, global.gameHeight - 270, sprite_get_width(spr_key_swap) / 2, spr_key_swap);
scr_vkey_init(VKEY.DASH, global.gameWidth - 70, global.gameHeight - 130, sprite_get_width(spr_key_dash) / 2, spr_key_dash);

