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
var minibossNum = 1;
var supplyNum = 3;
var shopNum = 1;
var questNum = 1;
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

repeat (questNum) {
	ds_list_add(eventList, "quest");
}
ds_list_shuffle(eventList);

// 월드 생성
var controlX = ds_grid_width(global.worldGrid) div 2;
var controlY = ds_grid_height(global.worldGrid) div 2;
var smallList = ds_list_create();
var bigList = ds_list_create();
var wlongList = ds_list_create();
var hlongList = ds_list_create();

global.worldGrid[# controlX, controlY] = 0;
scr_world_room_reset(global.worldGrid[# controlX, controlY], "small", "stage", room_stage_start);

for (var i = 1; i < roomNum; i++) {
	var isCreateRoom = false;

	do {
		var previousX = controlX;
		var previousY = controlY;
		var controlDir = choose("east", "west", "south", "north");
		var roomShape, roomEvent;
	
		if (i == roomNum - 1) {
			// 보스 스테이지 설정
			roomShape = "small";
			roomEvent = "boss";
		}
		else {
			// 일반 스테이지 설정
			roomShape = choose("small", "big", "wlong", "hlong");
			var eventTurn = max(floor((roomNum - 2) / ds_list_size(eventList)), 1);

			if (i mod eventTurn == 0) {
				roomEvent = eventList[| i / eventTurn - 1];
			}
			else {
				roomEvent = "stage";
			}
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
						isCreateRoom = true;

						if (ds_list_empty(smallList)) {
							var _smallList = global.roomParentMap[? room_parent_stage_small];

							for (var j = 0; j < ds_list_size(_smallList); j++) {
								ds_list_add(smallList, _smallList[| j]);
							}
							ds_list_shuffle(smallList);
						}
						scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, smallList[| ds_list_size(smallList) - 1]);
						ds_list_delete(smallList, ds_list_size(smallList) - 1);
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
							isCreateRoom = true;

							if (ds_list_empty(bigList)) {
								var _bigList = global.roomParentMap[? room_parent_stage_big];

								for (var j = 0; j < ds_list_size(_bigList); j++) {
									ds_list_add(bigList, _bigList[| j]);
								}
								ds_list_shuffle(bigList);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, bigList[| ds_list_size(bigList) - 1]);
							ds_list_delete(bigList, ds_list_size(bigList) - 1);
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
							isCreateRoom = true;
							
							if (ds_list_empty(wlongList)) {
								var _wlongList = global.roomParentMap[? room_parent_stage_wlong];

								for (var j = 0; j < ds_list_size(_wlongList); j++) {
									ds_list_add(wlongList, _wlongList[| j]);
								}
								ds_list_shuffle(wlongList);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, wlongList[| ds_list_size(wlongList) - 1]);
							ds_list_delete(wlongList, ds_list_size(wlongList) - 1);
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
							isCreateRoom = true;
							
							if (ds_list_empty(hlongList)) {
								var _hlongList = global.roomParentMap[? room_parent_stage_hlong];

								for (var j = 0; j < ds_list_size(_hlongList); j++) {
									ds_list_add(hlongList, _hlongList[| j]);
								}
								ds_list_shuffle(hlongList);
							}
							scr_world_room_reset(global.worldGrid[# controlX, controlY], roomShape, roomEvent, hlongList[| ds_list_size(hlongList) - 1]);
							ds_list_delete(hlongList, ds_list_size(hlongList) - 1);
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

// 월드 세이브
global.saveMap[? "worldGrid"] = ds_grid_write(global.worldGrid);

// 룸 입구 생성
for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		if (global.worldGrid[# _x, _y] != WALL) {
			scr_room_entry_reset(global.worldGrid[# _x, _y], _x, _y);	
		}
	}
}