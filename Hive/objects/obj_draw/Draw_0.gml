// 깊이 순서 정렬
var instCount = instance_number(obj_parent_depth);
var depthGrid = ds_grid_create(2, instCount);
var yy = 0;
	
with (obj_parent_depth) {
	depthGrid[# 0, yy] = id;
	depthGrid[# 1, yy] = y;
	yy++;
}
ds_grid_sort(depthGrid, 1, true);

for (var i = 0; i < instCount; i++) {
	var instID = depthGrid[# 0, i];

	with (instID) {
		// 그림자 그리기
		draw_sprite_ext(spr_vfx_shadow, 0, x, y, sprite_width / sprite_get_width(spr_vfx_shadow), 1, 0, c_white, 1);
		
		switch (object_index) {
			#region obj_chr
			case obj_chr:
				var secondWeapon;

				// 부무장 그리기
				if (global.chrMap[? "swap"] == "ranger") {
					secondWeapon = warriorSprite;
				}
				else if (global.chrMap[? "swap"] == "warrior") {
					secondWeapon = rangerSprite;
				}
				draw_sprite_ext(secondWeapon, 0, x, y - 24, 1, 1, 90 + 20 * weaponDir, c_gray, 1);
				
				// 캐릭터 그리기
				if (isHit) {
					gpu_set_fog(true, c_white, 0, 0);
				}
				draw_sprite_ext(chrSprite, isMove * -1, x, y, weaponDir, 1, 0, c_white, 1);
				gpu_set_fog(false, c_white, 0, 0);

				// 무기 그리기
				if (global.chrMap[? "swap"] == "ranger") {
					draw_sprite_ext(rangerSprite, 0, x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 16, 1, weaponDir, weaponAngle, c_white, 1);
				}
				else if (global.chrMap[? "swap"] == "warrior") {
					draw_sprite_ext(warriorSprite, 0, x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 16, 1, weaponDir * warriorDir, weaponAngle + 110 * weaponDir * warriorDir, c_white, 1);
				}
				break;
			#endregion
			#region default
			default:
				if (isHit) {
					gpu_set_fog(true, c_white, 0, 0);
				}
				draw_self();
				gpu_set_fog(false, c_white, 0, 0);
				break;
			#endregion
		}
	}
}
ds_grid_destroy(depthGrid);