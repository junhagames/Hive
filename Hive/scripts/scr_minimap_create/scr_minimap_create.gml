/// @description 미니맵 생성

var minimapw = sprite_get_width(spr_ui_minimap_small);
var minimaph = sprite_get_height(spr_ui_minimap_small);
var overlapList = ds_list_create();

minimapSuf = surface_create(ds_grid_width(global.worldGrid) * minimapw * 1.5 * global.zoom,
	ds_grid_height(global.worldGrid) * minimaph * 1.5 * global.zoom);
surface_set_target(minimapSuf);
draw_clear_alpha(c_white, 0);

for (var _y = 0; _y < ds_grid_height(global.worldGrid); _y++) {
	for (var _x = 0; _x < ds_grid_width(global.worldGrid); _x++) {
		var index = global.worldGrid[# _x, _y];
		
		if (ds_list_find_index(overlapList, index) == -1 && index != WALL) {
			var _roomMap = global.roomMap[? index];
			var infoMap = _roomMap[? "info"]; 
			ds_list_add(overlapList, index);

			if (infoMap[? "search"] != "unknown") {
				var minimapSprite, minimapIndex, iconSprite, color;

				switch (infoMap[? "shape"]) {
					case "small":			
						minimapSprite = spr_ui_minimap_small;
						break;
					case "big":
						minimapSprite = spr_ui_minimap_big;
						break;
					case "wlong":
						minimapSprite = spr_ui_minimap_wlong;
						break;
					case "hlong":
						minimapSprite = spr_ui_minimap_hlong;
						break;
				}
				
				switch (infoMap[? "search"]) {
					case "known":
						minimapIndex = 0;
						break;
					case "close":
						minimapIndex = 1;
						break;
				}
			
				switch (infoMap[? "event"]) {
					case "boss":
						iconSprite = spr_ui_minimap_boss;
						break;
					case "miniboss":
						iconSprite = spr_ui_minimap_miniboss;
						break;
					case "supply":			
						iconSprite = spr_ui_minimap_supply;
						break;
					case "shop":
						iconSprite = spr_ui_minimap_shop;
						break;
					case "quest":
						iconSprite = spr_ui_minimap_quest;
						break;
				}
			
				var marginX = ds_grid_width(global.worldGrid) * 0.25;
				var marginY = ds_grid_height(global.worldGrid) * 0.25;
				var minimapSpriteX = _x * minimapw + minimapw * marginX;
				var minimapSpriteY = _y * minimaph + minimaph * marginY;
				
				if (index == global.currentIndex) {
					minimapX = _x * minimapw + sprite_get_width(minimapSprite) / 2 + minimapw * marginX - 100;
					minimapY = _y * minimaph + sprite_get_height(minimapSprite) / 2 + minimaph * marginY - 100;
					color = c_white;
				}
				else {
					color = make_color_hsv(10 * (index mod 255), 255, 255);	
				}
			
				// 미니맵 그리기
				draw_sprite_ext(minimapSprite, minimapIndex, minimapSpriteX, minimapSpriteY, 1, 1, 0, color, 1);
			
				// 미니맵 아이콘 그리기
				if (infoMap[? "event"] != "stage") {
					draw_sprite_ext(iconSprite, 0,
						minimapSpriteX + (sprite_get_width(minimapSprite) - minimapw) / minimapw * minimapw / 2,
						minimapSpriteY + (sprite_get_height(minimapSprite) - minimaph) / minimaph * minimaph / 2,
						1, 1, 0, c_white, 1);
				}
			}
		}
	}
}
surface_reset_target();
ds_list_destroy(overlapList);