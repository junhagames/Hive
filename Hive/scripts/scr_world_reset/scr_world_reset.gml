/// @description 월드 무작위 초기화
/// @param roomNum
/// @param roomWidth
/// @param roomHeight

var roomNum = argument0;
var roomWidth = argument1; 
var roomHeight = argument2;

// 월드 초기화
global.currentIndex = 0;
ds_grid_resize(global.worldGrid, roomWidth, roomHeight);

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		global.worldGrid[# _x, _y] = WALL;	
	}
}

// 룸 이벤트 추가|섞기
var minibossNum = 2;
var supplyNum = 3;
var shopNum = 1;
var encounterNum = 3;
var eventList = ds_list_create();

repeat (minibossNum) {
	ds_list_add(eventList, "miniboss");
}

repeat (supplyNum) {
	ds_list_add(eventList, "supply");
}

repeat (shopNum) {
	ds_list_add(eventList, "shop");
}

repeat (encounterNum) {
	ds_list_add(eventList, "encounter");
}
ds_list_shuffle(eventList);

var smallRoom, bigRoom, wlongRoom, hlongRoom, bossRoom, minibossRoom, supplyRoom, shopRoom, encounterRoom;

switch (global.currentWorld) {
	case "city":
		smallRoom = room_parent_city_small;
		bigRoom = room_parent_city_big;
		wlongRoom = room_parent_city_wlong;
		hlongRoom = room_parent_city_hlong;
		bossRoom = room_parent_city_boss;
		minibossRoom = room_parent_city_miniboss;
		supplyRoom = room_parent_city_supply;
		shopRoom = room_parent_city_shop;
		encounterRoom = room_parent_city_encounter;
		break;
	case "swamp":
		smallRoom = room_parent_swamp_small;
		bigRoom = room_parent_swamp_big;
		wlongRoom = room_parent_swamp_wlong;
		hlongRoom = room_parent_swamp_hlong;
		bossRoom = room_parent_swamp_boss;
		minibossRoom = room_parent_swamp_miniboss;
		supplyRoom = room_parent_swamp_supply;
		shopRoom = room_parent_swamp_shop;
		encounterRoom = room_parent_swamp_encounter;
		break;
	case "underground":
		smallRoom = room_parent_underground_small;
		bigRoom = room_parent_underground_big;
		wlongRoom = room_parent_underground_wlong;
		hlongRoom = room_parent_underground_hlong;
		bossRoom = room_parent_underground_boss;
		minibossRoom = room_parent_underground_miniboss;
		supplyRoom = room_parent_underground_supply;
		shopRoom = room_parent_underground_shop;
		encounterRoom = room_parent_underground_encounter;
		break;
	case "jungle":
		smallRoom = room_parent_jungle_small;
		bigRoom = room_parent_jungle_big;
		wlongRoom = room_parent_jungle_wlong;
		hlongRoom = room_parent_jungle_hlong;
		bossRoom = room_parent_jungle_boss;
		minibossRoom = room_parent_jungle_miniboss;
		supplyRoom = room_parent_jungle_supply;
		shopRoom = room_parent_jungle_shop;
		encounterRoom = room_parent_jungle_encounter;
		break;
	case "desert":
		smallRoom = room_parent_desert_small;
		bigRoom = room_parent_desert_big;
		wlongRoom = room_parent_desert_wlong;
		hlongRoom = room_parent_desert_hlong;
		bossRoom = room_parent_desert_boss;
		minibossRoom = room_parent_desert_miniboss;
		supplyRoom = room_parent_desert_supply;
		shopRoom = room_parent_desert_shop;
		encounterRoom = room_parent_desert_encounter;
		break;
	case "school":
		smallRoom = room_parent_school_small;
		bigRoom = room_parent_school_big;
		wlongRoom = room_parent_school_wlong;
		hlongRoom = room_parent_school_hlong;
		bossRoom = room_parent_school_boss;
		minibossRoom = room_parent_school_miniboss;
		supplyRoom = room_parent_school_supply;
		shopRoom = room_parent_school_shop;
		encounterRoom = room_parent_school_encounter;
		break;	
}

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
var shopList = ds_list_create();
var encounterList = ds_list_create();

global.worldGrid[# controlX, controlY] = 0;
scr_world_room_reset(global.worldGrid[# controlX, controlY], "small", "stage", room_city_start);

for (var i = 1; i < roomNum; i++) {
	var isCreateRoom = false;

	do {
		var previousX = controlX;
		var previousY = controlY;
		var controlDir = choose("east", "west", "south", "north");
		var roomShape, roomEvent;
	
		// 룸 이벤트 설정
		if (i == roomNum - 1) {
			roomEvent = "boss";
		}
		else {
			var eventTurn = max(floor((roomNum - 2) / ds_list_size(eventList)), 1);

			if (i mod eventTurn == 0) {	
				roomEvent = eventList[| i / eventTurn - 1];
			}
			else {
				roomEvent = "stage";
			}
		}
		
		// 룸 모양 설정
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
			case "shop":
				roomShape = "small";
				break;
			case "encounter":
				roomShape = "big";
				break;
		}

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
						
						if (roomEvent == "stage") {
							roomlist = smallList;
							_roomList = global.roomParentMap[? smallRoom];
						}
						else if (roomEvent == "boss") {
							roomlist = bossList;
							_roomList = global.roomParentMap[? bossRoom];
						}
						else if (roomEvent == "miniboss") {
							roomlist = minibossList;
							_roomList = global.roomParentMap[? minibossRoom];
						}
						else if (roomEvent == "supply") {
							roomlist = supplyList;
							_roomList = global.roomParentMap[? supplyRoom];
						}
						else if (roomEvent == "shop") {
							roomlist = shopList;
							_roomList = global.roomParentMap[? shopRoom];
						}
						else if (roomEvent == "encounter") {
							roomlist = encounterList;
							_roomList = global.roomParentMap[? encounterRoom];
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
						
							if (roomEvent == "stage") {
								roomlist = bigList;
								_roomList = global.roomParentMap[? bigRoom];
							}
							else if (roomEvent == "boss") {
								roomlist = bossList;
								_roomList = global.roomParentMap[? bossRoom];
							}
							else if (roomEvent == "miniboss") {
								roomlist = minibossList;
								_roomList = global.roomParentMap[? minibossRoom];
							}
							else if (roomEvent == "supply") {
								roomlist = supplyList;
								_roomList = global.roomParentMap[? supplyRoom];
							}
							else if (roomEvent == "shop") {
								roomlist = shopList;
								_roomList = global.roomParentMap[? shopRoom];
							}
							else if (roomEvent == "encounter") {
								roomlist = encounterList;
								_roomList = global.roomParentMap[? encounterRoom];
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
						
							if (roomEvent == "stage") {
								roomlist = wlongList;
								_roomList = global.roomParentMap[? wlongRoom];
							}
							else if (roomEvent == "boss") {
								roomlist = bossList;
								_roomList = global.roomParentMap[? bossRoom];
							}
							else if (roomEvent == "miniboss") {
								roomlist = minibossList;
								_roomList = global.roomParentMap[? minibossRoom];
							}
							else if (roomEvent == "supply") {
								roomlist = supplyList;
								_roomList = global.roomParentMap[? supplyRoom];
							}
							else if (roomEvent == "shop") {
								roomlist = shopList;
								_roomList = global.roomParentMap[? shopRoom];
							}
							else if (roomEvent == "encounter") {
								roomlist = encounterList;
								_roomList = global.roomParentMap[? encounterRoom];
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
						
							if (roomEvent == "stage") {
								roomlist = hlongList;
								_roomList = global.roomParentMap[? hlongRoom];
							}
							else if (roomEvent == "boss") {
								roomlist = bossList;
								_roomList = global.roomParentMap[? bossRoom];
							}
							else if (roomEvent == "miniboss") {
								roomlist = minibossList;
								_roomList = global.roomParentMap[? minibossRoom];
							}
							else if (roomEvent == "supply") {
								roomlist = supplyList;
								_roomList = global.roomParentMap[? supplyRoom];
							}
							else if (roomEvent == "shop") {
								roomlist = shopList;
								_roomList = global.roomParentMap[? shopRoom];
							}
							else if (roomEvent == "encounter") {
								roomlist = encounterList;
								_roomList = global.roomParentMap[? encounterRoom];
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
ds_list_destroy(shopList);
ds_list_destroy(encounterList);

// 룸 입구 생성
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] != WALL) {
			scr_room_entry_reset(global.worldGrid[# _x, _y], _x, _y);	
		}
	}
}