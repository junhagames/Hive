/// @description 룸 입구 생성
/// @param index
/// @param _x
/// @param _y

var index = argument0;
var _x = argument1;
var _y = argument2;

var worldIndex = global.worldList[| index];
var infoMap = worldIndex[| MARK.INFO];
var entryIndex = worldIndex[| MARK.ENTRY];
var entryCount = ds_list_size(entryIndex);

switch (infoMap[? "shape"]) {
	#region SMALL
	case SHAPE.SMALL:
		/*   ■
		 *   □
		 *  
		 */
		if (_y > 0) {
			var targetIndex = global.worldGrid[# _x, _y - 1];
			
			if (targetIndex != index && targetIndex != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				var entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "targetRoomID"] = targetIndex;
				entryMap[? "pos"] = POS.TOP;
			}
		}
		
		/*   
		 *   □ ■
		 *  
		 */
		if (_x < ds_grid_width(global.worldGrid) - 1) {	
			var targetIndex = global.worldGrid[# _x + 1, _y];
			
			if (targetIndex != index && targetIndex != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				var entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "targetRoomID"] = targetIndex;
				entryMap[? "pos"] = POS.RIGHT;
			}
		}
		
		/*   
		 *   □ 
		 *   ■
		 */ 
		if (_y < ds_grid_height(global.worldGrid) - 1) {
			var targetIndex = global.worldGrid[# _x, _y + 1];
			
			if (targetIndex != index && targetIndex != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				var entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "targetRoomID"] = targetIndex;
				entryMap[? "pos"] = POS.BOTTOM;
			}
		}
		
		/*   
		 * ■ □ 
		 *   
		 */
		if (_x > 0) {
			var targetIndex = global.worldGrid[# _x - 1, _y];
			
			if (targetIndex != index && targetIndex != WALL) {
				entryIndex[| entryCount] = ds_map_create();
				ds_list_mark_as_map(entryIndex, entryCount);
				var entryMap = entryIndex[| entryCount];
				entryCount++;
				
				entryMap[? "targetRoomID"] = targetIndex;
				entryMap[? "pos"] = POS.LEFT;
			}
		}
		break;
	#endregion
	#region BIG
	case SHAPE.BIG:	
		if (_x > 0) {
			if (global.worldGrid[# _x - 1, _y] != index) {	 
				if (_y > 0) {
					if (global.worldGrid[# _x, _y - 1] != index) {
						/*   ■
						 *   □ □
						 *   □ □
						 *
						 */
						var targetIndex = global.worldGrid[# _x, _y - 1];
						
						if (targetIndex != index && targetIndex != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							var entryMap = entryIndex[| entryCount];
							entryCount++;
							
							entryMap[? "targetRoomID"] = targetIndex;
							entryMap[? "pos"] = POS.TOP_LEFT;
						}
						
						/* 
						 * ■ □ □
						 *   □ □
						 *
						 */
						var targetIndex = global.worldGrid[# _x - 1, _y];
						
						if (targetIndex != index && targetIndex != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							var entryMap = entryIndex[| entryCount];
							entryCount++;
				
							entryMap[? "targetRoomID"] = targetIndex;
							entryMap[? "pos"] = POS.LEFT_TOP;
						}
					}
					else {
						/*   
						 *   □ □
						 *   □ □
						 *	 ■
						 */
						if (_y < ds_grid_height(global.worldGrid) - 1) {
							var targetIndex = global.worldGrid[# _x, _y + 1];
						
							if (targetIndex != index && targetIndex != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								var entryMap = entryIndex[| entryCount];
								entryCount++;
							
								entryMap[? "targetRoomID"] = targetIndex;
								entryMap[? "pos"] = POS.BOTTOM_LEFT;
							}
						}
						
						/* 
						 *   □ □
						 * ■ □ □
						 *  
						 */
						var targetIndex = global.worldGrid[# _x - 1, _y];
						
						if (targetIndex != index && targetIndex != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							var entryMap = entryIndex[| entryCount];
							entryCount++;
							
							entryMap[? "targetRoomID"] = targetIndex;
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
					var targetIndex = global.worldGrid[# _x - 1, _y];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
							
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.LEFT_TOP;
					}
				}
			}
			else {
				if (_y > 0) {
					if (global.worldGrid[# _x, _y - 1] != index) {
						/*     ■
						 *   □ □
						 *   □ □
						 *
						 */
						var targetIndex = global.worldGrid[# _x, _y - 1];
						
						if (targetIndex != index && targetIndex != WALL) {
							entryIndex[| entryCount] = ds_map_create();
							ds_list_mark_as_map(entryIndex, entryCount);
							var entryMap = entryIndex[| entryCount];
							entryCount++;
						
							entryMap[? "targetRoomID"] = targetIndex;
							entryMap[? "pos"] = POS.TOP_RIGHT;
						}
						
						/*     
						 *   □ □ ■
						 *   □ □
						 *
						 */
						if (_x < ds_grid_width(global.worldGrid) - 1) {
							var targetIndex = global.worldGrid[# _x + 1, _y];
						
							if (targetIndex != index && targetIndex != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								var entryMap = entryIndex[| entryCount];
								entryCount++;
						
								entryMap[? "targetRoomID"] = targetIndex;
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
						if (_x < ds_grid_width(global.worldGrid) - 1) {
							var targetIndex = global.worldGrid[# _x + 1, _y];
						
							if (targetIndex != index && targetIndex != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								var entryMap = entryIndex[| entryCount];
								entryCount++;
							
								entryMap[? "targetRoomID"] = targetIndex;
								entryMap[? "pos"] = POS.RIGHT_BOTTOM;
							}
						}
					
						/*   
						 *   □ □
						 *   □ □
						 *	   ■
					 	 */  
						if (_y < ds_grid_height(global.worldGrid) - 1) {
							var targetIndex = global.worldGrid[# _x, _y + 1];
						
							if (targetIndex != index && targetIndex != WALL) {
								entryIndex[| entryCount] = ds_map_create();
								ds_list_mark_as_map(entryIndex, entryCount);
								var entryMap = entryIndex[| entryCount];
								entryCount++;
						
								entryMap[? "targetRoomID"] = targetIndex;
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
			if (_y > 0) {
				var targetIndex = global.worldGrid[# _x, _y - 1];
				
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
							
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.TOP_LEFT;
				}
			}
			
			/* | 
			 * | □ □
			 * | □ □
			 * | ■
			 */
			if (_y < ds_grid_height(global.worldGrid) - 1) {
				var targetIndex = global.worldGrid[# _x, _y + 1];
				
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.BOTTOM_LEFT;
				}
			}
		}
		break;
	#endregion
	#region WLONG
	case SHAPE.WLONG:
		if (_x > 0) {
			if (global.worldGrid[# _x - 1, _y] != index) {
				/*   ■
				 *   □ □
				 *
				 */
				if (_y > 0) {
					var targetIndex = global.worldGrid[# _x, _y - 1];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.TOP_LEFT;
					}
				}
				
				/*   
				 *   □ □
				 *   ■
				 */
				if (_y < ds_grid_height(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x, _y + 1];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.BOTTOM_LEFT;
					}
				}
				
				/*   
				 * ■ □ □
				 *   
				 */
				var targetIndex = global.worldGrid[# _x - 1, _y];
				
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
				
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.LEFT;
				}
			}
			else {
				/*     ■
				 *   □ □
				 *   
				 */
				if (_y > 0) {
					var targetIndex = global.worldGrid[# _x, _y - 1];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.TOP_RIGHT;
					}
				}
				
				/*     
				 *   □ □ ■
				 *   
				 */
				if (_x < ds_grid_width(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x + 1, _y];
				
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.RIGHT;
					}
				}
				
				/*     
				 *   □ □
				 *     ■
				 */
				if (_y < ds_grid_height(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x, _y + 1];
				
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
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
			if (_y > 0) {
				var targetIndex = global.worldGrid[# _x, _y - 1];
				
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
							
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.TOP_LEFT;
				}
			}
			
			/* | 
			 * | □ □
			 * | ■
			 */
			if (_y < ds_grid_height(global.worldGrid) - 1) {
				var targetIndex = global.worldGrid[# _x, _y + 1];
				
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.BOTTOM_LEFT;
				}
			}
		}
		break;
	#endregion
	#region HLONG
	case SHAPE.HLONG:
		if (_y > 0) {
			if (global.worldGrid[# _x, _y - 1] != index) {
				/*   ■
				 *   □
				 *   □
				 *
				 */
				var targetIndex = global.worldGrid[# _x, _y - 1];
					
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.TOP;
				}
				
				/*   
				 *   □ ■
				 *   □
				 *
				 */
				if (_x < ds_grid_width(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x + 1, _y];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.RIGHT_TOP;
					}
				}
				
				/*   
				 * ■ □ 
				 *   □
				 *
				 */				
				if (_x > 0) {
					var targetIndex = global.worldGrid[# _x - 1, _y];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
				
						entryMap[? "targetRoomID"] = targetIndex;
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
				if (_x < ds_grid_width(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x + 1, _y];
					
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
						
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.RIGHT_BOTTOM;
					}
				}
			
				/*   
				 *   □ 
				 *   □ 
				 *   ■
				 */
				if (_y < ds_grid_height(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x, _y + 1];
				
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
						entryMap[? "pos"] = POS.BOTTOM;
					}
				}
			
				/*   
				 *   □ 
				 * ■ □ 
				 *   
				 */
				if (_x > 0) {
					var targetIndex = global.worldGrid[# _x - 1, _y];
				
					if (targetIndex != index && targetIndex != WALL) {
						entryIndex[| entryCount] = ds_map_create();
						ds_list_mark_as_map(entryIndex, entryCount);
						var entryMap = entryIndex[| entryCount];
						entryCount++;
					
						entryMap[? "targetRoomID"] = targetIndex;
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
			if (_x > 0) {
				var targetIndex = global.worldGrid[# _x - 1, _y];
			
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.LEFT_TOP;
				}
			}
			
			/* -------
			 *   □ ■ 
			 *   □
			 *
			 */
			if (_x < ds_grid_width(global.worldGrid) - 1) {
				var targetIndex = global.worldGrid[# _x + 1, _y];
			
				if (targetIndex != index && targetIndex != WALL) {
					entryIndex[| entryCount] = ds_map_create();
					ds_list_mark_as_map(entryIndex, entryCount);
					var entryMap = entryIndex[| entryCount];
					entryCount++;
					
					entryMap[? "targetRoomID"] = targetIndex;
					entryMap[? "pos"] = POS.RIGHT_TOP;
				}
			}
		}
		break;
	#endregion
}