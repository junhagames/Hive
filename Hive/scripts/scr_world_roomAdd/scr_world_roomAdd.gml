/// @description 새로운 룸 추가
/// @param index
/// @param pos_x
/// @param pos_y

var index = argument0;
var pos_x = argument1;
var pos_y = argument2;

var worldIndex = worldList[| index];
worldIndex[| MARK.ENTRY_POS] = ds_list_create();
worldIndex[| MARK.ENTRY_OBJECT] = ds_list_create();
worldIndex[| MARK.HIVE_OBJECT] = ds_list_create();
ds_list_mark_as_list(worldIndex, MARK.ENTRY_POS);
ds_list_mark_as_list(worldIndex, MARK.ENTRY_OBJECT);
ds_list_mark_as_list(worldIndex, MARK.HIVE_OBJECT);

var entryPosList = worldIndex[| MARK.ENTRY_POS];
var infoMap = worldIndex[| MARK.INFO];

var entryObjectIndex = worldIndex[| MARK.ENTRY_OBJECT];
//entryObjectIndex[| i] = ds_map_create();
//ds_list_mark_as_map(entryObjectIndex, i);
	
#region Add entry

switch (infoMap[? "shape"]) {
	#region SMALL
	case SHAPE.SMALL:
		for (var i = POS.TOP; i <= POS.LEFT; i++) {
			switch (i) {
				case POS.TOP:
					if (pos_y > 0) {
						var target_index = worldGrid[# pos_x, pos_y - 1];
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, target_index);
						}
					}
					break;
				case POS.RIGHT:
					if (pos_x < ds_grid_width(worldGrid) - 1) {	
						var target_index = worldGrid[# pos_x + 1, pos_y];
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, target_index);
						}
					}
					break;
				case POS.BOTTOM:
					if (pos_y < ds_grid_height(worldGrid) - 1) {
						var target_index = worldGrid[# pos_x, pos_y + 1];
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, target_index);
						}
					}
					break;
				case POS.LEFT:
					if (pos_x > 0) {
						var target_index = worldGrid[# pos_x - 1, pos_y];
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, target_index);
						}
					}
					break;
			}
		}
		break;
	#endregion
	#region BIG
	case SHAPE.BIG:	
		if (pos_x > 0) {
			if (worldGrid[# pos_x - 1, pos_y] != index) {
				if (pos_y > 0) {
					if (worldGrid[# pos_x, pos_y - 1] != index) {
						/* 
						 * ■ □ □
						 *   □ □
						 *
						*/
						var target_index = worldGrid[# pos_x - 1, pos_y];
						
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, POS.LEFT_TOP);
						}
						
						/*   ■
						 *   □ □
						 *   □ □
						 *
						*/
						var target_index = worldGrid[# pos_x, pos_y - 1];
						
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, POS.TOP_LEFT);
						}
					}
					else {
						/* 
						 *   □ □
						 * ■ □ □
						 *  
						*/
						var target_index = worldGrid[# pos_x - 1, pos_y];
						
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, POS.LEFT_BOTTOM);
						}
						
						/*   
						 *   □ □
						 *   □ □
						 *	 ■
						*/
						if (pos_y < ds_grid_height(worldGrid) - 1) {
							var target_index = worldGrid[# pos_x, pos_y + 1];
						
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.BOTTOM_LEFT);
							}
						}
					}
				}
				else {
					/* -------
					 * ■ □ □
					 *   □ □
					 *
					*/
					var target_index = worldGrid[# pos_x - 1, pos_y];
					
					if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
						ds_list_add(entryPosList, POS.LEFT_TOP);
					}
				}
			}
			else {
				if (pos_y > 0) {
					if (pos_x < ds_grid_width(worldGrid) - 1) {	
						if (worldGrid[# pos_x, pos_y - 1] != index) {
							/*     
							 *   □ □ ■
							 *   □ □
							 *
							*/
							var target_index = worldGrid[# pos_x + 1, pos_y];
							
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.RIGHT_TOP);
							}
						
							/*     ■
							 *   □ □
							 *   □ □
							 *
							*/
							var target_index = worldGrid[# pos_x, pos_y - 1];
							
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.TOP_RIGHT);
							}
						}
						else {
							/* 
							 *   □ □
							 *   □ □ ■
							 *  
							*/
							var target_index = worldGrid[# pos_x + 1, pos_y];
							
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.RIGHT_BOTTOM);
							}
						
							/*   
							 *   □ □
							 *   □ □
							 *	   ■
							*/  
							if (pos_y < ds_grid_height(worldGrid) - 1) {
								var target_index = worldGrid[# pos_x, pos_y + 1];
							
								if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
									ds_list_add(entryPosList, POS.BOTTOM_RIGHT);
								}
							}
						}
					}
					else {
						if (worldGrid[# pos_x, pos_y - 1] != index) {
							/*     ■ |
							 *   □ □ |
							 *   □ □ |
							 *       |
							*/
							var target_index = worldGrid[# pos_x, pos_y - 1];
							
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.TOP_RIGHT);
							}
						}
						
						if (pos_y < ds_grid_height(worldGrid) - 1) {
							/*       |
							 *   □ □ |
							 *   □ □ |
							 *     ■ |
							*/
							var target_index = worldGrid[# pos_x, pos_y + 1];
							
							if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
								ds_list_add(entryPosList, POS.BOTTOM_RIGHT);
							}
						}
					}
				}
				else {
					if (pos_x < ds_grid_width(worldGrid) - 1) {
						/* -------
						 *   □ □ ■
						 *   □ □ 
						 *
						*/
						var target_index = worldGrid[# pos_x + 1, pos_y];
						
						if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
							ds_list_add(entryPosList, POS.RIGHT_TOP);
						}
					}
				}
			}	
		}
		else {
			if (pos_y > 0) {
				/* | ■
				 * | □ □
				 * | □ □
				 * |
				*/
				var target_index = worldGrid[# pos_x, pos_y - 1];
				
				if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
					ds_list_add(entryPosList, POS.TOP_LEFT);
				}
			}
			
			if (pos_y < ds_grid_height(worldGrid) - 1) {
				/* | 
				 * | □ □
				 * | □ □
				 * | ■
				*/
				var target_index = worldGrid[# pos_x, pos_y + 1];
				if (target_index != index && target_index != WALL && ds_list_find_index(entryPosList, target_index) == -1) {
					ds_list_add(entryPosList, POS.BOTTOM_LEFT);
				}
			}
		}
		break;
	#endregion
	case SHAPE.WLONG:
		break;
	case SHAPE.HLONG:
		break;
}
#endregion

#region Add hive
var hiveIndex = worldIndex[| MARK.HIVE_OBJECT];

for (var i = 0; i < 3; i++) {
	hiveIndex[| i] = ds_map_create();
	ds_list_mark_as_map(hiveIndex, i);
	
	var hiveList = hiveIndex[| i];
	hiveList[? "id"] = i;
	hiveList[? "x"] = random(room_width);
	hiveList[? "y"] = random(room_height);
	hiveList[? "hp"] = 100;
}
#endregion