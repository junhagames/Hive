/// @description 룸 입구 초기화
/// @param index
/// @param _x
/// @param _y

var index = argument0;
var _x = argument1;
var _y = argument2;

var _roomMap = global.roomMap[? index];
var infoMap = _roomMap[? "info"];
var entryMap = _roomMap[? "entry"];

switch (infoMap[? "shape"]) {
	#region small
	case "small":
		/*   ■
		 *   □
		 *  
		 */
		if (_y > 0) {
			var targetIndex = global.worldGrid[# _x, _y - 1];
			
			if (targetIndex != index && targetIndex != WALL) {
				var entryIndex = ds_map_size(entryMap);
				ds_map_add_map(entryMap, entryIndex, ds_map_create());
				
				var _entryMap = entryMap[? entryIndex];
				_entryMap[? "targetIndex"] = targetIndex;
				_entryMap[? "pos"] = "top";
			}
		}
		
		/*   
		 *   □ ■
		 *  
		 */
		if (_x < ds_grid_width(global.worldGrid) - 1) {	
			var targetIndex = global.worldGrid[# _x + 1, _y];
			
			if (targetIndex != index && targetIndex != WALL) {
				var entryIndex = ds_map_size(entryMap);
				ds_map_add_map(entryMap, entryIndex, ds_map_create());
				
				var _entryMap = entryMap[? entryIndex];
				_entryMap[? "targetIndex"] = targetIndex;
				_entryMap[? "pos"] = "right";
			}
		}
		
		/*   
		 *   □ 
		 *   ■
		 */ 
		if (_y < ds_grid_height(global.worldGrid) - 1) {
			var targetIndex = global.worldGrid[# _x, _y + 1];
			
			if (targetIndex != index && targetIndex != WALL) {
				var entryIndex = ds_map_size(entryMap);
				ds_map_add_map(entryMap, entryIndex, ds_map_create());
				
				var _entryMap = entryMap[? entryIndex];
				_entryMap[? "targetIndex"] = targetIndex;
				_entryMap[? "pos"] = "bottom";
			}
		}
		
		/*   
		 * ■ □ 
		 *   
		 */
		if (_x > 0) {
			var targetIndex = global.worldGrid[# _x - 1, _y];
			
			if (targetIndex != index && targetIndex != WALL) {
				var entryIndex = ds_map_size(entryMap);
				ds_map_add_map(entryMap, entryIndex, ds_map_create());
				
				var _entryMap = entryMap[? entryIndex];
				_entryMap[? "targetIndex"] = targetIndex;
				_entryMap[? "pos"] = "left";
			}
		}
		break;
	#endregion
	#region big
	case "big":	
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
							var entryIndex = ds_map_size(entryMap);
							ds_map_add_map(entryMap, entryIndex, ds_map_create());
							
							var _entryMap = entryMap[? entryIndex];
							_entryMap[? "targetIndex"] = targetIndex;
							_entryMap[? "pos"] = "topleft";
						}
						
						/* 
						 * ■ □ □
						 *   □ □
						 *
						 */
						var targetIndex = global.worldGrid[# _x - 1, _y];
						
						if (targetIndex != index && targetIndex != WALL) {
							var entryIndex = ds_map_size(entryMap);
							ds_map_add_map(entryMap, entryIndex, ds_map_create());

							var _entryMap = entryMap[? entryIndex];
							_entryMap[? "targetIndex"] = targetIndex;
							_entryMap[? "pos"] = "lefttop";
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
								var entryIndex = ds_map_size(entryMap);
								ds_map_add_map(entryMap, entryIndex, ds_map_create());
								
								var _entryMap = entryMap[? entryIndex];
								_entryMap[? "targetIndex"] = targetIndex;
								_entryMap[? "pos"] = "bottomleft";
							}
						}
						
						/* 
						 *   □ □
						 * ■ □ □
						 *  
						 */
						var targetIndex = global.worldGrid[# _x - 1, _y];
						
						if (targetIndex != index && targetIndex != WALL) {
							var entryIndex = ds_map_size(entryMap);
							ds_map_add_map(entryMap, entryIndex, ds_map_create());
							
							var _entryMap = entryMap[? entryIndex];
							_entryMap[? "targetIndex"] = targetIndex;
							_entryMap[? "pos"] = "leftbottom";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "lefttop";
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
							var entryIndex = ds_map_size(entryMap);
							ds_map_add_map(entryMap, entryIndex, ds_map_create());
							
							var _entryMap = entryMap[? entryIndex];
							_entryMap[? "targetIndex"] = targetIndex;
							_entryMap[? "pos"] = "topright";
						}
						
						/*     
						 *   □ □ ■
						 *   □ □
						 *
						 */
						if (_x < ds_grid_width(global.worldGrid) - 1) {
							var targetIndex = global.worldGrid[# _x + 1, _y];
						
							if (targetIndex != index && targetIndex != WALL) {
								var entryIndex = ds_map_size(entryMap);
								ds_map_add_map(entryMap, entryIndex, ds_map_create());
								
								var _entryMap = entryMap[? entryIndex];
								_entryMap[? "targetIndex"] = targetIndex;
								_entryMap[? "pos"] = "righttop";
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
								var entryIndex = ds_map_size(entryMap);
								ds_map_add_map(entryMap, entryIndex, ds_map_create());
								
								var _entryMap = entryMap[? entryIndex];
								_entryMap[? "targetIndex"] = targetIndex;
								_entryMap[? "pos"] = "rightbottom";
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
								var entryIndex = ds_map_size(entryMap);
								ds_map_add_map(entryMap, entryIndex, ds_map_create());
								
								var _entryMap = entryMap[? entryIndex];
								_entryMap[? "targetIndex"] = targetIndex;
								_entryMap[? "pos"] = "bottomright";
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
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];	
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "topleft";
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
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "bottomleft";
				}
			}
		}
		break;
	#endregion
	#region wlong
	case "wlong":
		if (_x > 0) {
			if (global.worldGrid[# _x - 1, _y] != index) {
				/*   ■
				 *   □ □
				 *
				 */
				if (_y > 0) {
					var targetIndex = global.worldGrid[# _x, _y - 1];
					
					if (targetIndex != index && targetIndex != WALL) {
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "topleft";
					}
				}
				
				/*   
				 *   □ □
				 *   ■
				 */
				if (_y < ds_grid_height(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x, _y + 1];
					
					if (targetIndex != index && targetIndex != WALL) {
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "bottomleft";
					}
				}
				
				/*   
				 * ■ □ □
				 *   
				 */
				var targetIndex = global.worldGrid[# _x - 1, _y];
				
				if (targetIndex != index && targetIndex != WALL) {
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "left";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "topright";
					}
				}
				
				/*     
				 *   □ □ ■
				 *   
				 */
				if (_x < ds_grid_width(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x + 1, _y];
				
					if (targetIndex != index && targetIndex != WALL) {
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "right";
					}
				}
				
				/*     
				 *   □ □
				 *     ■
				 */
				if (_y < ds_grid_height(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x, _y + 1];
				
					if (targetIndex != index && targetIndex != WALL) {
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "bottomright";
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
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];	
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "topleft";
				}
			}
			
			/* | 
			 * | □ □
			 * | ■
			 */
			if (_y < ds_grid_height(global.worldGrid) - 1) {
				var targetIndex = global.worldGrid[# _x, _y + 1];
				
				if (targetIndex != index && targetIndex != WALL) {
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "bottomleft";
				}
			}
		}
		break;
	#endregion
	#region hlong
	case "hlong":
		if (_y > 0) {
			if (global.worldGrid[# _x, _y - 1] != index) {
				/*   ■
				 *   □
				 *   □
				 *
				 */
				var targetIndex = global.worldGrid[# _x, _y - 1];
					
				if (targetIndex != index && targetIndex != WALL) {
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "top";
				}
				
				/*   
				 *   □ ■
				 *   □
				 *
				 */
				if (_x < ds_grid_width(global.worldGrid) - 1) {
					var targetIndex = global.worldGrid[# _x + 1, _y];
					
					if (targetIndex != index && targetIndex != WALL) {
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "righttop";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "lefttop";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "rightbottom";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "bottom";
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
						var entryIndex = ds_map_size(entryMap);
						ds_map_add_map(entryMap, entryIndex, ds_map_create());
						
						var _entryMap = entryMap[? entryIndex];
						_entryMap[? "targetIndex"] = targetIndex;
						_entryMap[? "pos"] = "leftbottom";
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
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "lefttop";
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
					var entryIndex = ds_map_size(entryMap);
					ds_map_add_map(entryMap, entryIndex, ds_map_create());
					
					var _entryMap = entryMap[? entryIndex];
					_entryMap[? "targetIndex"] = targetIndex;
					_entryMap[? "pos"] = "righttop";
				}
			}
		}
		break;
	#endregion
}