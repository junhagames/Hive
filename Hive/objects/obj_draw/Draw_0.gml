var _depthGrid = depthGrid;
var instNum = instance_number(obj_parent_depth);
ds_grid_resize(_depthGrid, 2, instNum);
	
var yy = 0;
	
with (obj_parent_depth){
	_depthGrid[# 0, yy] = id;
	_depthGrid[# 1, yy] = y;
	yy++;
}
ds_grid_sort(depthGrid, 1, true);

yy = 0;

repeat (instNum) {
	var instanceID = depthGrid[# 0, yy];
	
	with (instanceID) {
		switch (instance_kind) {
			#region obj_chr
			case obj_chr:
				if (angle > 0 && angle < 180) {
					draw_sprite_ext(weaponSprite, isMove * -1, x + lengthdir_x(weaponLen, angle), y + lengthdir_y(weaponLen, angle) - 8, 1, xdir, angle, c_white, 1);
					draw_sprite_ext(spr_chr, isMove * -1, x, y, image_xscale * xdir, image_yscale, image_angle, image_blend, image_alpha);
				}
				else {
					draw_sprite_ext(spr_chr, isMove * -1, x, y, image_xscale * xdir, image_yscale, image_angle, image_blend, image_alpha);
					draw_sprite_ext(weaponSprite, isMove * -1, x + lengthdir_x(weaponLen, angle), y + lengthdir_y(weaponLen, angle) - 8, 1, xdir, angle, c_white, 1);
				}
				break;
			#endregion
			#region default
			default:
				draw_self();
			#endregion
		}
	}
	yy++;
}
ds_grid_clear(depthGrid, 0);