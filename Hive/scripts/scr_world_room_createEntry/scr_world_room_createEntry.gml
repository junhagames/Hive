/// @description 룸 입구 생성
/// @param index
/// @param pos_x
/// @param pos_y

var index = argument0;
var pos_x = argument1;
var pos_y = argument2;

var worldIndex = global.worldList[| index];
var infoMap = worldIndex[| MARK.INFO];

var entryIndex = worldIndex[| MARK.ENTRY];
var entryMap;
var entryCount = ds_list_size(entryIndex);

switch (infoMap[? "shape"]) {
	#region SMALL
	case SHAPE.SMALL:
		/*   ■
		 *   □
		 *  
		 */
		if (pos_y > 0) {
			var target_index = global.worldGrid[# pos_x, pos_y - 1];
			
			if (target_index != index && target_index != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "target_roomId"] = target_index;
				entryMap[? "pos"] = POS.TOP;
			}
		}
		
		/*   
		 *   □ ■
		 *  
		 */
		if (pos_x < ds_grid_width(global.worldGrid) - 1) {	
			var target_index = global.worldGrid[# pos_x + 1, pos_y];
			
			if (target_index != index && target_index != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "target_roomId"] = target_index;
				entryMap[? "pos"] = POS.RIGHT;
			}
		}
		
		/*   
		 *   □ 
		 *   ■
		 */ 
		if (pos_y < ds_grid_height(global.worldGrid) - 1) {
			var target_index = global.worldGrid[# pos_x, pos_y + 1];
			
			if (target_index != index && target_index != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "target_roomId"] = target_index;
				entryMap[? "pos"] = POS.BOTTOM;
			}
		}
		
		/*   
		 * ■ □ 
		 *   
		 */
		if (pos_x > 0) {
			var target_index = global.worldGrid[# pos_x - 1, pos_y];
			
			if (target_index != index && target_index != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "target_roomId"] = target_index;
				entryMap[? "pos"] = POS.LEFT;
			}
		}
		break;
	#endregion
	#region BIG
	case SHAPE.BIG:	
		if (pos_x > 0) {
			if (global.worldGrid[# pos_x - 1, pos_y] != index) {	 
				if (pos_y > 0) {
					if (global.worldGrid[# pos_x, pos_y - 1] != index) {
						/*   ■
						 *   □ □
						 *   □ □
						 *
						 */
						var target_index = global.worldGrid[# pos_x, pos_y - 1];
						
						if (target_index != index && target_index != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							entryMap = entryIndex[| entryCount];
							entryCount++;
							
							entryMap[? "target_roomId"] = target_index;
							entryMap[? "pos"] = POS.TOP_LEFT;
						}
						
						/* 
						 * ■ □ □
						 *   □ □
						 *
						 */
						var target_index = global.worldGrid[# pos_x - 1, pos_y];
						
						if (target_index != index && target_index != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							entryMap = entryIndex[| entryCount];
							entryCount++;
				
							entryMap[? "target_roomId"] = target_index;
							entryMap[? "pos"] = POS.LEFT_TOP;
						}
					}
					else {
						/*   
						 *   □ □
						 *   □ □
						 *	 ■
						 */
						if (pos_y < ds_grid_height(global.worldGrid) - 1) {
							var target_index = global.worldGrid[# pos_x, pos_y + 1];
						
							if (target_index != index && target_index != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								entryMap = entryIndex[| entryCount];
								entryCount++;
							
								entryMap[? "target_roomId"] = target_index;
								entryMap[? "pos"] = POS.BOTTOM_LEFT;
							}
						}
						
						/* 
						 *   □ □
						 * ■ □ □
						 *  
						 */
						var target_index = global.worldGrid[# pos_x - 1, pos_y];
						
						if (target_index != index && target_index != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							entryMap = entryIndex[| entryCount];
							entryCount++;
							
							entryMap[? "target_roomId"] = target_index;
							entryMap[? "pos"] = POS.LEFT_BOTTOM;
						}
					}
				}
				else {
					/* -------
					 * ■ □ □
					 *   □ □
					 *
					 */
					var target_index = global.worldGrid[# pos_x - 1, pos_y];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
							
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.LEFT_TOP;
					}
				}
			}
			else {
				if (pos_y > 0) {
					if (global.worldGrid[# pos_x, pos_y - 1] != index) {
						/*     ■
						 *   □ □
						 *   □ □
						 *
						 */
						var target_index = global.worldGrid[# pos_x, pos_y - 1];
						
						if (target_index != index && target_index != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							entryMap = entryIndex[| entryCount];
							entryCount++;
						
							entryMap[? "target_roomId"] = target_index;
							entryMap[? "pos"] = POS.TOP_RIGHT;
						}
						
						/*     
						 *   □ □ ■
						 *   □ □
						 *
						 */
						if (pos_x < ds_grid_width(global.worldGrid) - 1) {
							var target_index = global.worldGrid[# pos_x + 1, pos_y];
						
							if (target_index != index && target_index != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								entryMap = entryIndex[| entryCount];
								entryCount++;
						
								entryMap[? "target_roomId"] = target_index;
								entryMap[? "pos"] = POS.RIGHT_TOP;
							}
						}
					}
					else {
						/* 
						 *   □ □
						 *   □ □ ■
						 *  
						 */
						if (pos_x < ds_grid_width(global.worldGrid) - 1) {
							var target_index = global.worldGrid[# pos_x + 1, pos_y];
						
							if (target_index != index && target_index != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								entryMap = entryIndex[| entryCount];
								entryCount++;
							
								entryMap[? "target_roomId"] = target_index;
								entryMap[? "pos"] = POS.RIGHT_BOTTOM;
							}
						}
					
						/*   
						 *   □ □
						 *   □ □
						 *	   ■
					 	 */  
						if (pos_y < ds_grid_height(global.worldGrid) - 1) {
							var target_index = global.worldGrid[# pos_x, pos_y + 1];
						
							if (target_index != index && target_index != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								entryMap = entryIndex[| entryCount];
								entryCount++;
						
								entryMap[? "target_roomId"] = target_index;
								entryMap[? "pos"] = POS.BOTTOM_RIGHT;
							}
						}
					}	
				}
			}
		}
		else {
			/* | ■
			 * | □ □
			 * | □ □
			 * |
			 */
			if (pos_y > 0) {
				var target_index = global.worldGrid[# pos_x, pos_y - 1];
				
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
							
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.TOP_LEFT;
				}
			}
			
			/* | 
			 * | □ □
			 * | □ □
			 * | ■
			 */
			if (pos_y < ds_grid_height(global.worldGrid) - 1) {
				var target_index = global.worldGrid[# pos_x, pos_y + 1];
				
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.BOTTOM_LEFT;
				}
			}
		}
		break;
	#endregion
	#region WLONG
	case SHAPE.WLONG:
		if (pos_x > 0) {
			if (global.worldGrid[# pos_x - 1, pos_y] != index) {
				/*   ■
				 *   □ □
				 *
				 */
				if (pos_y > 0) {
					var target_index = global.worldGrid[# pos_x, pos_y - 1];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.TOP_LEFT;
					}
				}
				
				/*   
				 *   □ □
				 *   ■
				 */
				if (pos_y < ds_grid_height(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x, pos_y + 1];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.BOTTOM_LEFT;
					}
				}
				
				/*   
				 * ■ □ □
				 *   
				 */
				var target_index = global.worldGrid[# pos_x - 1, pos_y];
				
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
				
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.LEFT;
				}
			}
			else {
				/*     ■
				 *   □ □
				 *   
				 */
				if (pos_y > 0) {
					var target_index = global.worldGrid[# pos_x, pos_y - 1];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.TOP_RIGHT;
					}
				}
				
				/*     
				 *   □ □ ■
				 *   
				 */
				if (pos_x < ds_grid_width(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x + 1, pos_y];
				
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.RIGHT;
					}
				}
				
				/*     
				 *   □ □
				 *     ■
				 */
				if (pos_y < ds_grid_height(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x, pos_y + 1];
				
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.BOTTOM_RIGHT;
					}
				}
			}
		}
		else {
			/* | ■
			 * | □ □
			 * |
			 */	 
			if (pos_y > 0) {
				var target_index = global.worldGrid[# pos_x, pos_y - 1];
				
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
							
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.TOP_LEFT;
				}
			}
			
			/* | 
			 * | □ □
			 * | ■
			 */
			if (pos_y < ds_grid_height(global.worldGrid) - 1) {
				var target_index = global.worldGrid[# pos_x, pos_y + 1];
				
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.BOTTOM_LEFT;
				}
			}
		}
		break;
	#endregion
	#region HLONG
	case SHAPE.HLONG:
		if (pos_y > 0) {
			if (global.worldGrid[# pos_x, pos_y - 1] != index) {
				/*   ■
				 *   □
				 *   □
				 *
				 */
				var target_index = global.worldGrid[# pos_x, pos_y - 1];
					
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.TOP;
				}
				
				/*   
				 *   □ ■
				 *   □
				 *
				 */
				if (pos_x < ds_grid_width(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x + 1, pos_y];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.RIGHT_TOP;
					}
				}
				
				/*   
				 * ■ □ 
				 *   □
				 *
				 */				
				if (pos_x > 0) {
					var target_index = global.worldGrid[# pos_x - 1, pos_y];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
				
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.LEFT_TOP;
					}
				}
			}
			else {
				/*   
				 *   □ 
				 *   □ ■
				 *
				 */
				if (pos_x < ds_grid_width(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x + 1, pos_y];
					
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
						
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.RIGHT_BOTTOM;
					}
				}
			
				/*   
				 *   □ 
				 *   □ 
				 *   ■
				 */
				if (pos_y < ds_grid_height(global.worldGrid) - 1) {
					var target_index = global.worldGrid[# pos_x, pos_y + 1];
				
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.BOTTOM;
					}
				}
			
				/*   
				 *   □ 
				 * ■ □ 
				 *   
				 */
				if (pos_x > 0) {
					var target_index = global.worldGrid[# pos_x - 1, pos_y];
				
					if (target_index != index && target_index != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "target_roomId"] = target_index;
						entryMap[? "pos"] = POS.LEFT_BOTTOM;
					}
				}
			}
		}
		else {
			/* -------
			 * ■ □ 
			 *   □
			 *
			 */
			if (pos_x > 0) {
				var target_index = global.worldGrid[# pos_x - 1, pos_y];
			
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.LEFT_TOP;
				}
			}
			
			/* -------
			 *   □ ■ 
			 *   □
			 *
			 */
			if (pos_x < ds_grid_width(global.worldGrid) - 1) {
				var target_index = global.worldGrid[# pos_x + 1, pos_y];
			
				if (target_index != index && target_index != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "target_roomId"] = target_index;
					entryMap[? "pos"] = POS.RIGHT_TOP;
				}
			}
		}
		break;
	#endregion
}