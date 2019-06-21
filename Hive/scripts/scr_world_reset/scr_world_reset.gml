/// @description 월드 무작위 초기화
/// @param worldName
/// @param roomNum
/// @param roomWidth
/// @param roomHeight

var worldName = argument0;
var roomNum = argument1;
var roomWidth = argument2; 
var roomHeight = argument3;

// 월드 초기화
ds_grid_resize(global.worldGrid, roomWidth, roomHeight);
ds_grid_clear(global.worldGrid, WALL);
ds_map_clear(global.roomMap);
global.currentWorld = worldName;
global.currentIndex = 0;
global.previousIndex = noone;
global.previousPos = noone;
global.isBossClear = false;

// 부모 룸 초기화
var startRoom, smallRoom, bigRoom, wlongRoom, hlongRoom, bossRoom, minibossRoom, supplyRoom, potionshopRoom, weaponshopRoom, encounterRoom;

switch (global.currentWorld) {
	case "city":
		startRoom = room_city_start;
		smallRoom = room_parent_city_small;
		bigRoom = room_parent_city_big;
		wlongRoom = room_parent_city_wlong;
		hlongRoom = room_parent_city_hlong;
		bossRoom = room_parent_city_boss;
		minibossRoom = room_parent_city_miniboss;
		supplyRoom = room_parent_city_supply;
		potionshopRoom = room_parent_city_potionshop;
		weaponshopRoom = room_parent_city_weaponshop;
		encounterRoom = room_parent_city_encounter;
		break;
	case "swamp":
		startRoom = room_swamp_start;
		smallRoom = room_parent_swamp_small;
		bigRoom = room_parent_swamp_big;
		wlongRoom = room_parent_swamp_wlong;
		hlongRoom = room_parent_swamp_hlong;
		bossRoom = room_parent_swamp_boss;
		minibossRoom = room_parent_swamp_miniboss;
		supplyRoom = room_parent_swamp_supply;
		potionshopRoom = room_parent_swamp_potionshop;
		weaponshopRoom = room_parent_swamp_weaponshop;
		encounterRoom = room_parent_swamp_encounter;
		break;
	case "underground":
		startRoom = room_underground_start;
		smallRoom = room_parent_underground_small;
		bigRoom = room_parent_underground_big;
		wlongRoom = room_parent_underground_wlong;
		hlongRoom = room_parent_underground_hlong;
		bossRoom = room_parent_underground_boss;
		minibossRoom = room_parent_underground_miniboss;
		supplyRoom = room_parent_underground_supply;
		potionshopRoom = room_parent_underground_potionshop;
		weaponshopRoom = room_parent_underground_weaponshop;
		encounterRoom = room_parent_underground_encounter;
		break;
	case "jungle":
		startRoom = room_jungle_start;
		smallRoom = room_parent_jungle_small;
		bigRoom = room_parent_jungle_big;
		wlongRoom = room_parent_jungle_wlong;
		hlongRoom = room_parent_jungle_hlong;
		bossRoom = room_parent_jungle_boss;
		minibossRoom = room_parent_jungle_miniboss;
		supplyRoom = room_parent_jungle_supply;
		potionshopRoom = room_parent_jungle_potionshop;
		weaponshopRoom = room_parent_jungle_weaponshop;
		encounterRoom = room_parent_jungle_encounter;
		break;
	case "desert":
		startRoom = room_desert_start;
		smallRoom = room_parent_desert_small;
		bigRoom = room_parent_desert_big;
		wlongRoom = room_parent_desert_wlong;
		hlongRoom = room_parent_desert_hlong;
		bossRoom = room_parent_desert_boss;
		minibossRoom = room_parent_desert_miniboss;
		supplyRoom = room_parent_desert_supply;
		potionshopRoom = room_parent_desert_potionshop;
		weaponshopRoom = room_parent_desert_weaponshop;
		encounterRoom = room_parent_desert_encounter;
		break;
	case "school":
		startRoom = room_school_start;
		smallRoom = room_parent_school_small;
		bigRoom = room_parent_school_big;
		wlongRoom = room_parent_school_wlong;
		hlongRoom = room_parent_school_hlong;
		bossRoom = room_parent_school_boss;
		minibossRoom = room_parent_school_miniboss;
		supplyRoom = room_parent_school_supply;
		potionshopRoom = room_parent_school_potionshop;
		weaponshopRoom = room_parent_school_weaponshop;
		encounterRoom = room_parent_school_encounter;
		break;	
}

// 룸 이벤트 추가|섞기
var eventList = ds_list_create();
var minibossNum = 2;
var supplyNum = 3;
var potionshopNum = 2;
var weaponshopNum = 2;
var encounterNum = 3;

repeat (minibossNum) {
	ds_list_add(eventList, "miniboss");
}

repeat (supplyNum) {
	ds_list_add(eventList, "supply");
}

repeat (potionshopNum) {
	ds_list_add(eventList, "potionshop");
}

repeat (weaponshopNum) {
	ds_list_add(eventList, "weaponshop");
}

repeat (encounterNum) {
	ds_list_add(eventList, "encounter");
}
ds_list_shuffle(eventList);
var eventTurn = max(floor((roomNum - 2) / ds_list_size(eventList)), 1);

// 월드 생성
var controlX = ds_grid_width(global.worldGrid) div 2;
var controlY = ds_grid_height(global.worldGrid) div 2;
var smallList = ds_list_create();
var bigList = ds_list_create();
var wlongList = ds_list_create();
var hlongList = ds_list_create();
var bossList = ds_list_create();
var minibossList = ds_list_create();
var supplyList = ds_list_create();
var potionshopList = ds_list_create();
var weaponshopList = ds_list_create();
var encounterList = ds_list_create();

global.worldGrid[# controlX, controlY] = 0;
scr_world_room_reset(global.worldGrid[# controlX, controlY], "small", "stage", startRoom);

var count = 0;

for (var i = 1; i < roomNum; i++) {
	var isCreateRoom = false;

	do {
		// 무한 루프 탈출
		count++;
		
		if (count > 2000) {
			ds_grid_clear(global.worldGrid, WALL);
			ds_map_clear(global.roomMap);

			ds_list_clear(eventList);
			
			repeat (minibossNum) {
				ds_list_add(eventList, "miniboss");
			}

			repeat (supplyNum) {
				ds_list_add(eventList, "supply");
			}

			repeat (potionshopNum) {
				ds_list_add(eventList, "potionshop");
			}
			
			repeat (weaponshopNum) {
				ds_list_add(eventList, "weaponshop");
			}

			repeat (encounterNum) {
				ds_list_add(eventList, "encounter");
			}
			ds_list_shuffle(eventList);
			
			ds_list_clear(smallList);
			ds_list_clear(bigList);
			ds_list_clear(wlongList);
			ds_list_clear(hlongList);
			ds_list_clear(bossList);
			ds_list_clear(minibossList);
			ds_list_clear(supplyList);
			ds_list_clear(potionshopList);
			ds_list_clear(weaponshopList);
			ds_list_clear(encounterList);
			
			controlX = ds_grid_width(global.worldGrid) div 2;
			controlY = ds_grid_height(global.worldGrid) div 2;
			
			global.worldGrid[# controlX, controlY] = 0;
			scr_world_room_reset(global.worldGrid[# controlX, controlY], "small", "stage", startRoom);
			
			count = 0;
			i = 1;
		}
	
		// 룸 이벤트 설정
		var roomEvent;

		if (i == roomNum - 1) {
			roomEvent = "boss";
		}
		else if (i mod eventTurn == 0) {	
			roomEvent = eventList[| i / eventTurn - 1];
		}
		else {
			roomEvent = "stage";
		}
		
		// 룸 모양 설정
		var roomShape;
		
		switch (roomEvent) {
			case "stage":
				roomShape = choose("small", "big", "wlong", "hlong");
				break;
			case "boss":
				roomShape = "big";
				break;
			case "miniboss":
				roomShape = "big";
				break;
			case "supply":
				roomShape = "small";
				break;
			case "potionshop":
				roomShape = "small";
				break;
			case "weaponshop":
				roomShape = "small";
				break;
			case "encounter":
				roomShape = "big";
				break;
		}
		var previousX = controlX;
		var previousY = controlY;
		var controlDir = choose("east", "west", "south", "north");

		switch (roomShape) {
			#region small
				case "small":
					switch (controlDir) {
						case "east":
							controlX++;
							break;
						case "west":
							controlX--;
							break;
						case "south":
							controlY++;
							break;
						case "north":
							controlY--;
							break;
					}
				
					if (controlX < 0 || controlY < 0 || controlX >= ds_grid_width(global.worldGrid) || controlY >= ds_grid_height(global.worldGrid)) {
						controlX = previousX;
						controlY = previousY;
					}
					else if (global.worldGrid[# controlX, controlY] == WALL) {
						global.worldGrid[# controlX, controlY] = i;
						var roomlist, _roomList;
						
						switch (roomEvent) {
							case "stage":
								roomlist = smallList;
								_roomList = global.roomParentMap[? smallRoom];
								break;
							case "boss":
								roomlist = bossList;
								_roomList = global.roomParentMap[? bossRoom];
								break;
							case "miniboss":
								roomlist = minibossList;
								_roomList = global.roomParentMap[? minibossRoom];
								break;
							case "supply":
								roomlist = supplyList;
								_roomList = global.roomParentMap[? supplyRoom];
								break;
							case "potionshop":
								roomlist = potionshopList;
								_roomList = global.roomParentMap[? potionshopRoom];
								break;
							case "weaponshop":
								roomlist = weaponshopList;
								_roomList = global.roomParentMap[? weaponshopRoom];
								break;
							case "encounter":
								roomlist = encounterList;
								_roomList = global.roomParentMap[? encounterRoom];
								break;
						}
						
						if (ds_list_empty(roomlist)) {
							for (var j = 0; j < ds_list_size(_roomList); j++) {
								ds_list_add(roomlist, _roomList[| j]);
							}
							ds_list_shuffle(roomlist);
						}
						scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, roomlist[| ds_list_size(roomlist) - 1]);
						ds_list_delete(roomlist, ds_list_size(roomlist) - 1);
						isCreateRoom = true;
					}
					break;
				#endregion
			#region big
				case "big":	
					var controlX1, controlY1, controlX2, controlY2;
			
					switch (controlDir) {
						case "east":
							controlX++;
							controlX1 = controlX;
							controlY1 = controlY + choose(0, -1);
							controlX2 = controlX1 + 1;
							controlY2 = controlY1 + 1;
							break;
						case "west":
							controlX--;
							controlX1 = controlX;
							controlY1 = controlY + choose(0, -1);
							controlX2 = controlX1 - 1;
							controlY2 = controlY1 + 1;
							break;
						case "south":
							controlY++;
							controlX1 = controlX + choose(0, -1);
							controlY1 = controlY;
							controlX2 = controlX1 + 1;
							controlY2 = controlY1 + 1;
							break;
						case "north":
							controlY--;
							controlX1 = controlX + choose(0, -1);
							controlY1 = controlY;
							controlX2 = controlX1 + 1;
							controlY2 = controlY1 - 1;
							break;
					}

					if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
						controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
						controlX = previousX;
						controlY = previousY;
					}
					else {
						var isEmpty = true;
					
						for (var j = 0; j < i; j++) {
							if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
								isEmpty = false;
								break;
							}
						}
					
						if (isEmpty) {
							ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
							var roomlist, _roomList;
						
							switch (roomEvent) {
								case "stage":
									roomlist = bigList;
									_roomList = global.roomParentMap[? bigRoom];
									break;
								case "boss":
									roomlist = bossList;
									_roomList = global.roomParentMap[? bossRoom];
									break;
								case "miniboss":
									roomlist = minibossList;
									_roomList = global.roomParentMap[? minibossRoom];
									break;
								case "supply":
									roomlist = supplyList;
									_roomList = global.roomParentMap[? supplyRoom];
									break;
								case "potionshop":
									roomlist = potionshopList;
									_roomList = global.roomParentMap[? potionshopRoom];
									break;
								case "weaponshop":
									roomlist = weaponshopList;
									_roomList = global.roomParentMap[? weaponshopRoom];
									break;
								case "encounter":
									roomlist = encounterList;
									_roomList = global.roomParentMap[? encounterRoom];
									break;
							}
						
							if (ds_list_empty(roomlist)) {
								for (var j = 0; j < ds_list_size(_roomList); j++) {
									ds_list_add(roomlist, _roomList[| j]);
								}
								ds_list_shuffle(roomlist);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, roomlist[| ds_list_size(roomlist) - 1]);
							ds_list_delete(roomlist, ds_list_size(roomlist) - 1);
							isCreateRoom = true;
						}
						else if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}	
					}
					break;
				#endregion
			#region wlong
				case "wlong":	
					var controlX1, controlY1, controlX2, controlY2;
			
					switch (controlDir) {
						case "east":
							controlX++;
							controlX1 = controlX;
							controlY1 = controlY;
							controlX2 = controlX1 + 1;
							controlY2 = controlY1;
							break;
						case "west":
							controlX--;
							controlX1 = controlX;
							controlY1 = controlY;
							controlX2 = controlX1 - 1;
							controlY2 = controlY1;
							break;
						case "south":
							controlY++;
							controlX1 = controlX + choose(0, -1);
							controlY1 = controlY;
							controlX2 = controlX1 + 1;
							controlY2 = controlY1;
							break;
						case "north":
							controlY--;
							controlX1 = controlX + choose(0, -1);
							controlY1 = controlY;
							controlX2 = controlX1 + 1;
							controlY2 = controlY1;
							break;
					}

					if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
						controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
						controlX = previousX;
						controlY = previousY;
					}
					else {
						var isEmpty = true;
					
						for (var j = 0; j < i; j++) {
							if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
								isEmpty = false;
								break;
							}
						}
					
						if (isEmpty) {
							ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
							var roomlist, _roomList;
						
							switch (roomEvent) {
								case "stage":
									roomlist = wlongList;
									_roomList = global.roomParentMap[? wlongRoom];
									break;
								case "boss":
									roomlist = bossList;
									_roomList = global.roomParentMap[? bossRoom];
									break;
								case "miniboss":
									roomlist = minibossList;
									_roomList = global.roomParentMap[? minibossRoom];
									break;
								case "supply":
									roomlist = supplyList;
									_roomList = global.roomParentMap[? supplyRoom];
									break;
								case "potionshop":
									roomlist = potionshopList;
									_roomList = global.roomParentMap[? potionshopRoom];
									break;
								case "weaponshop":
									roomlist = weaponshopList;
									_roomList = global.roomParentMap[? weaponshopRoom];
									break;
								case "encounter":
									roomlist = encounterList;
									_roomList = global.roomParentMap[? encounterRoom];
									break;
							}
						
							if (ds_list_empty(roomlist)) {
								for (var j = 0; j < ds_list_size(_roomList); j++) {
									ds_list_add(roomlist, _roomList[| j]);
								}
								ds_list_shuffle(roomlist);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, roomlist[| ds_list_size(roomlist) - 1]);
							ds_list_delete(roomlist, ds_list_size(roomlist) - 1);
							isCreateRoom = true;
						}
						else if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}
					}
					break;
				#endregion
			#region hlong
				case "hlong":	
					var controlX1, controlY1, controlX2, controlY2;
				
					switch (controlDir) {
						case "east":
							controlX++;
							controlX1 = controlX;
							controlY1 = controlY + choose(0, -1);
							controlX2 = controlX1;
							controlY2 = controlY1 + 1;
							break;
						case "west":
							controlX--;
							controlX1 = controlX;
							controlY1 = controlY + choose(0, -1);
							controlX2 = controlX1;
							controlY2 = controlY1 + 1;
							break;
						case "south":
							controlY++;
							controlX1 = controlX;
							controlY1 = controlY;
							controlX2 = controlX1;
							controlY2 = controlY1 + 1;
							break;
						case "north":
							controlY--;
							controlX1 = controlX;
							controlY1 = controlY;
							controlX2 = controlX1;
							controlY2 = controlY1 - 1;
							break;
					}

					if (controlX1 < 0 || controlY1 < 0 || controlX1 >= ds_grid_width(global.worldGrid) || controlY1 >= ds_grid_height(global.worldGrid) ||
						controlX2 < 0 || controlY2 < 0 || controlX2 >= ds_grid_width(global.worldGrid) || controlY2 >= ds_grid_height(global.worldGrid)) {
						controlX = previousX;
						controlY = previousY;
					}
					else {
						var isEmpty = true;
						
						for (var j = 0; j < i; j++) {
							if (ds_grid_value_exists(global.worldGrid, controlX1, controlY1, controlX2, controlY2, j)) {
								isEmpty = false;
								break;
							}
						}
					
						if (isEmpty) {
							ds_grid_set_region(global.worldGrid, controlX1, controlY1, controlX2, controlY2, i);
							var roomlist, _roomList;
						
							switch (roomEvent) {
								case "stage":
									roomlist = hlongList;
									_roomList = global.roomParentMap[? hlongRoom];
									break;
								case "boss":
									roomlist = bossList;
									_roomList = global.roomParentMap[? bossRoom];
									break;
								case "miniboss":
									roomlist = minibossList;
									_roomList = global.roomParentMap[? minibossRoom];
									break;
								case "supply":
									roomlist = supplyList;
									_roomList = global.roomParentMap[? supplyRoom];
									break;
								case "potionshop":
									roomlist = potionshopList;
									_roomList = global.roomParentMap[? potionshopRoom];
									break;
								case "weaponshop":
									roomlist = weaponshopList;
									_roomList = global.roomParentMap[? weaponshopRoom];
									break;
								case "encounter":
									roomlist = encounterList;
									_roomList = global.roomParentMap[? encounterRoom];
									break;
							}
						
							if (ds_list_empty(roomlist)) {
								for (var j = 0; j < ds_list_size(_roomList); j++) {
									ds_list_add(roomlist, _roomList[| j]);
								}
								ds_list_shuffle(roomlist);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, roomlist[| ds_list_size(roomlist) - 1]);
							ds_list_delete(roomlist, ds_list_size(roomlist) - 1);
							isCreateRoom = true;
						}
						else if (global.worldGrid[# controlX, controlY] == WALL) {
							controlX = previousX;
							controlY = previousY;
						}
					}
					break;
				#endregion
		}
	}
	until (isCreateRoom);
}
ds_list_destroy(eventList);
ds_list_destroy(smallList);
ds_list_destroy(bigList);
ds_list_destroy(wlongList);
ds_list_destroy(hlongList);
ds_list_destroy(bossList);
ds_list_destroy(minibossList);
ds_list_destroy(supplyList);
ds_list_destroy(potionshopList);
ds_list_destroy(weaponshopList);
ds_list_destroy(encounterList);

// 룸 입구 생성
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] != WALL) {
			scr_room_entry_reset(global.worldGrid[# _x, _y], _x, _y);	
		}
	}
}