var _roomMap = global.roomMap[? global.currentIndex];
var infoMap = _roomMap[? "info"];
var entryMap = _roomMap[? "entry"];

// 광원 초기화
lightSuf = surface_create(global.gameWidth * global.zoom, global.gameHeight * global.zoom);

// 시야 밝히기
infoMap[? "search"] = "known";

#region 입구 생성
with (obj_parent_entry) {
	var isEntry = false;
	
	for (var i = 0; i < ds_map_size(entryMap); i++) {
		var _entryMap = entryMap[? i];
		
		if (pos == _entryMap[? "pos"]) {
			targetIndex = _entryMap[? "targetIndex"];
			isEntry = true;
			break;
		}
	}
	var block = instance_create_layer(x, y, "layer_solid", obj_solid_block);
	block.image_xscale = sprite_width / block.sprite_width;
	block.image_yscale = sprite_height / block.sprite_height;
		
	if (isEntry) {
		var targetRoomMap = global.roomMap[? targetIndex];
		var targetInfoMap = targetRoomMap[? "info"];
		
		// 인접한 룸 시야 밝히기
		if (targetInfoMap[? "search"] == "unknown") { 
			targetInfoMap[? "search"] = "close";
		}
		
		// 입구 스프라이트 설정
		var posTo;
		
		if (pos == "top" || pos == "topleft" || pos == "topright") {
			posTo = "top";
		}
		else if (pos == "right" || pos == "righttop" || pos == "rightbottom") {
			posTo = "right"
		}
		else if (pos == "bottom" || pos == "bottomright" || pos == "bottomleft") {
			posTo = "bottom";
		}
		else if (pos == "left" || pos == "leftbottom" || pos == "lefttop") {
			posTo = "left"
		}
				
		switch (targetInfoMap[? "event"]) {
			#region boss
			case "boss":
				if (posTo == "top") {
					sprite_index = spr_entry_boss_top;
				}
				else if (posTo == "right") {
					sprite_index = spr_entry_boss_right;
				}
				else if (posTo == "bottom") {
					sprite_index = spr_entry_boss_bottom;
				}
				else if (posTo == "left") {
					sprite_index = spr_entry_boss_left;
				}
				break;
			#endregion
			#region miniboss
			case "miniboss":
				if (posTo == "top") {
					sprite_index = spr_entry_miniboss_top;
				}
				else if (posTo == "right") {
					sprite_index = spr_entry_miniboss_right;
				}
				else if (posTo == "bottom") {
					sprite_index = spr_entry_miniboss_bottom;
				}
				else if (posTo == "left") {
					sprite_index = spr_entry_miniboss_left;
				}
				break;
			#endregion
			#region supply
			case "supply":
				if (posTo == "top") {
					sprite_index = spr_entry_supply_top;
				}
				else if (posTo == "right") {
					sprite_index = spr_entry_supply_right;
				}
				else if (posTo == "bottom") {
					sprite_index = spr_entry_supply_bottom;
				}
				else if (posTo == "left") {
					sprite_index = spr_entry_supply_left;
				}
				break;
			#endregion
			#region shop
			case "shop":
				if (posTo == "top") {
					sprite_index = spr_entry_shop_top;
				}
				else if (posTo == "right") {
					sprite_index = spr_entry_shop_right;
				}
				else if (posTo == "bottom") {
					sprite_index = spr_entry_shop_bottom;
				}
				else if (posTo == "left") {
					sprite_index = spr_entry_shop_left;
				}
				break;
			#endregion
			#region default
			default:
				switch (global.currentWorld) {
					#region city
					case "city":
						if (posTo == "top") {
							sprite_index = spr_entry_city_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_city_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_city_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_city_left;
						}
						break;
					#endregion
					#region swamp;
					case "swamp":
						if (posTo == "top") {
							sprite_index = spr_entry_swamp_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_swamp_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_swamp_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_swamp_left;
						}
						break;
					#endregion
					#region underground
					case "underground":
						if (posTo == "top") {
							sprite_index = spr_entry_underground_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_underground_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_underground_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_underground_left;
						}
						break;
					#endregion
					#region jungle
					case "jungle":
						if (posTo == "top") {
							sprite_index = spr_entry_jungle_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_jungle_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_jungle_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_jungle_left;
						}
						break;
					#endregion
					#region desert
					case "desert":
						if (posTo == "top") {
							sprite_index = spr_entry_desert_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_desert_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_desert_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_desert_left;
						}
						break;
					#endregion
					#region school
					case "school":
						if (posTo == "top") {
							sprite_index = spr_entry_school_top;
						}
						else if (posTo == "right") {
							sprite_index = spr_entry_school_right;
						}
						else if (posTo == "bottom") {
							sprite_index = spr_entry_desert_bottom;
						}
						else if (posTo == "left") {
							sprite_index = spr_entry_school_left;
						}
						break;
					#endregion
				}
				break;
			#endregion
		}
		
		// 막혀있는 블럭 ID 지정
		blockID = block.id;
	}
	else {
		instance_destroy();
	}
}
#endregion
#region 캐릭터|시스템 생성
var startX = 0;
var startY = 0; 

if (global.previousIndex == noone) {
	startX = room_width / 2;
	startY = room_height / 2;
}
else {
	with (obj_parent_entry) {
		var entryw = (bbox_left + bbox_right) / 2;
		var entryh = (bbox_top + bbox_bottom) / 2;
		var chrw = 80;
		var chrh = 80;

		if (targetIndex == global.previousIndex && !instance_exists(obj_chr)) {
			var entryCount = 0;
			
			for (var i = 0; i < ds_map_size(entryMap); i++) {
				var _entryMap = entryMap[? i];
					
				if (targetIndex == _entryMap[? "targetIndex"]) {
					entryCount++;
				}
			}
			
			if (global.previousPos == "top" || global.previousPos == "topleft" || global.previousPos == "topright") {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == "topleft" && pos == "bottomleft") || (global.previousPos == "topright" && pos == "bottomright")))) {
					startX = entryw;
					startY = entryh - chrh;
				}
			}
			else if (global.previousPos == "right" || global.previousPos == "righttop" || global.previousPos == "rightbottom") {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == "righttop" && pos == "lefttop") || (global.previousPos == "rightbottom" && pos == "leftbottom")))) {
					startX = entryw + chrw;
					startY = entryh;
				}
			}
			else if (global.previousPos == "bottom" || global.previousPos == "bottomright" || global.previousPos == "bottomleft") {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == "bottomright" && pos == "topright") || (global.previousPos == "bottomleft" && pos == "topleft")))) {
					startX = entryw;
					startY = entryh + chrh;
				}
			}
			else if (global.previousPos == "left" || global.previousPos == "leftbottom" || global.previousPos == "lefttop") {
				if (entryCount == 1 ||
					(entryCount == 2 && ((global.previousPos == "leftbottom" && pos == "rightbottom") || (global.previousPos == "lefttop" && pos == "righttop")))) {
					startX = entryw - chrw;
					startY = entryh;
				}
			}
		}
	}
}
instance_create_layer(startX, startY, "layer_inst", obj_chr);
instance_create_layer(0, 0, "layer_system", obj_camera);
instance_create_layer(0, 0, "layer_draw", obj_draw);
#endregion

// 인스턴스 세이브|불러오기
scr_room_inst_start();

// 길찾기 그리드 생성
enemyPathGrid = mp_grid_create(0, 0, room_width div CELL_WIDTH, room_height div CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
mp_grid_add_instances(enemyPathGrid, obj_parent_solid, false);
mp_grid_add_instances(enemyPathGrid, obj_parent_entry, false);

// 미니맵 생성
scr_minimap_create();