if (distance_to_point(mouse_x, mouse_y) < 1 &&
	(os_type == os_windows || (os_type == os_android && mouse_check_button(mb_left)))) {
	image_xscale = scr_tween_to(image_xscale, 1.2, 0.4);
	image_yscale = scr_tween_to(image_yscale, 1.2, 0.4);
}
else {
	image_xscale = scr_tween_to(image_xscale, 1, 0.4);
	image_yscale = scr_tween_to(image_yscale, 1, 0.4);
}