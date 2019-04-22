// Depth sort order
var instCount = instance_number(obj_parent_depth);
ds_grid_resize(depthGrid, 2, instCount);
	
var yy = 0;
	
with (obj_parent_depth) {
	obj_draw.depthGrid[# 0, yy] = id;
	obj_draw.depthGrid[# 1, yy] = y;
	yy++;
}
ds_grid_sort(depthGrid, 1, true);

yy = 0;

repeat (instCount) {
	var instID = depthGrid[# 0, yy];

	with (instID) {
		switch (object_index) {
			#region obj_chr
			case obj_chr:
				if (weaponAngle > 0 && weaponAngle < 180) {
					draw_sprite_ext(weaponSprite, isMove * -1, x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, 1, weaponDir, weaponAngle, c_white, 1);
					draw_sprite_ext(spr_chr, isMove * -1, x, y, image_xscale * weaponDir, image_yscale, image_angle, image_blend, image_alpha);
				}
				else {
					draw_sprite_ext(spr_chr, isMove * -1, x, y, image_xscale * weaponDir, image_yscale, image_angle, image_blend, image_alpha);
					draw_sprite_ext(weaponSprite, isMove * -1, x + lengthdir_x(weaponLength, weaponAngle), y + lengthdir_y(weaponLength, weaponAngle) - 8, 1, weaponDir, weaponAngle, c_white, 1);
				}
				break;
			#endregion
			#region default
			default:
				draw_self();
				break;
			#endregion
		}
	}
	yy++;
}