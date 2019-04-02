// Draw self
if (chr_angle > 0 && chr_angle < 180) {
	draw_sprite_ext(spr_weapon1, chr_isMove * -1, x + lengthdir_x(16, chr_angle), y + lengthdir_y(16, chr_angle), 1, chr_xdir, chr_angle, c_white, 1);
	draw_sprite_ext(spr_chr, chr_isMove * -1, x, y, image_xscale * chr_xdir, image_yscale, image_angle, image_blend, image_alpha);
}
else {
	draw_sprite_ext(spr_chr, chr_isMove * -1, x, y, image_xscale * chr_xdir, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(spr_weapon1, chr_isMove * -1, x + lengthdir_x(16, chr_angle), y + lengthdir_y(16, chr_angle), 1, chr_xdir, chr_angle, c_white, 1);
}
	