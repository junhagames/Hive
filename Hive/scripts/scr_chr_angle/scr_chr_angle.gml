chr_angle = point_direction(x, y, mouse_x, mouse_y);

if (chr_angle > 90 && chr_angle < 270) {
	chr_xdir = -1;
}
else {
	chr_xdir = 1;
}