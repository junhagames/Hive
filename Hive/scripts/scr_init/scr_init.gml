/// @description 게임 초기화

#region 메크로 상수
#macro VERSION "1.2"
#macro SETTING_FILE "setting.ini"
#macro SAVE_FILE "save.sav"
#macro WALL -1
#macro CELL_WIDTH 40
#macro CELL_HEIGHT 40
#endregion
#region 열거형
#region 가상 조이스틱|키
enum VSTICK {
	MOVE,
}

enum VKEY {
	ATTACK,
	SKILL,
	SWAP,
	DASH,
	MINIMAP,
	MENU,
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
#endregion
#region 메뉴
enum MENU {
	LIST,
	STATUS,
	INVENTORY,
	DICTIONARY,
	ACHIEVEMENTS,
	OPTION,
	EXIT,
}

enum MENU_LIST {
	STATUS,
	INVENTORY,
	DICTIONARY,
	ACHIEVEMENTS,
	OPTION,
	EXIT,
}
#endregion
#region 적 상태
enum ENEMY_STATE {
	IDLE,
	WANDER,
	ALERT,
}
#endregion
#region 알람
enum ALARM_STORY {
	TEXT,
}

enum ALARM_CHR {
	ATTACK,
	SKILL,
	DAMAGE,
	SWAP,
	DASH,
	RELOAD,
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
#region 무기
#region 원거리무기
enum PISTOL {
	DAMAGE = 2,
	SPEED = 7.8,
	ACCURACY = 15,
	AMMO = 15,
}

enum DEAGLE {
	DAMAGE = 5,
	SPEED = 7.8,
	ACCURACY = 10,
	AMMO = 15,
}

enum UZI {
	DAMAGE = 3,
	SPEED = 4.8,
	ACCURACY = 30,
	AMMO = 30,
}

enum SHOTGUN {
	DAMAGE = 2,
	SPEED = 18,
	ACCURACY = 20,
	AMMO = 5,
}

enum SNIPER {
	DAMAGE = 20,
	SPEED = 24,
	ACCURACY = 0,
	AMMO = 4,
}
#endregion
#region 근접무기
enum BAT {
	DAMAGE = 5,
	SPEED = 18,
}

enum AXE {
	DAMAGE = 10,
	SPEED = 18,
}

enum CROWBAR {
	DAMAGE = 12,
	SPEED = 12,
}

enum HAMMER {
	DAMAGE = 15,
	SPEED = 12,
}

enum PLUNGER {
	DAMAGE = 5,
	SPEED = 6,
}

enum KNIFE {
	DAMAGE = 20,
	SPEED = 12,
}

enum CHICKEN {
	DAMAGE = 20,
	SPEED = 6,
}
#endregion
#endregion
#endregion
#region 게임 설정|데이터 불러오기
ini_open(SETTING_FILE);

if (!file_exists(SETTING_FILE)) {
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
#region 파티클 초기화
#region 안개
global.particleSmoke = part_type_create();
part_type_shape(global.particleSmoke, pt_shape_smoke);
part_type_size(global.particleSmoke, 2, 6, 0.01, 0);
part_type_orientation(global.particleSmoke, 0, 360, 0, 2, 0);
part_type_life(global.particleSmoke, room_speed * 3, room_speed * 4);
part_type_blend(global.particleSmoke, true);
part_type_alpha3(global.particleSmoke, 0.001, 0.03, 0.001);
part_type_color3(global.particleSmoke, c_red, c_orange, c_red);
#endregion
#region 잉것불
global.particleEmber = part_type_create();
part_type_shape(global.particleEmber, pt_shape_pixel);
part_type_size(global.particleEmber, 4, 4, 0, 0);
part_type_speed(global.particleEmber, 2, 4, 0, 0);
part_type_direction(global.particleEmber, 70, 110, 0, 0);
part_type_orientation(global.particleEmber, 0, 360, 0, 2, 0);
part_type_life(global.particleEmber, room_speed * 1, room_speed * 2);
part_type_alpha3(global.particleEmber, 0.8, 0.6, 0.1);
part_type_color3(global.particleEmber, c_red, c_orange, c_yellow);
#endregion
#region 화염
global.particleFlame = part_type_create();
part_type_shape(global.particleFlame, pt_shape_explosion);
part_type_scale(global.particleFlame, 1, 1);
part_type_alpha3(global.particleFlame, 1, 1, 0);
part_type_color3(global.particleFlame, c_white, c_yellow, c_red);
part_type_speed(global.particleFlame, 3, 6, 0, 0);
part_type_direction(global.particleFlame, 80, 100, 0, 10);
part_type_life(global.particleFlame, 10, 20);
#endregion
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
	
	if (roomName == "room_parent_school_small" ||
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
	else if (roomParent != noone && roomName != "room_school_start") {
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

// 마우스 커서 초기화
global.cursorSprite = spr_cursor_normal;

// 더블 좌클릭시 우클릭 방지
device_mouse_dbclick_enable(false);