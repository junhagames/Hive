if (surface_exists(pauseSuf)) {
	draw_surface_ext(pauseSuf, 0, 0, global.zoom / global.resolution, global.zoom / global.resolution, 0, c_white, 1);
}
draw_set_alpha(0.3);
draw_set_color(c_black);
draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
draw_set_color(c_white);
draw_set_alpha(1);

draw_text_transformed(global.gameWidth / 2 * global.zoom, global.gameHeight / 2 * global.zoom, "PAUSE", 3, 3, 0);