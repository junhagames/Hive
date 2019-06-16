draw_sprite(pauseSprite, 0, 0, 0);

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, global.gameWidth, global.gameHeight, false);
draw_set_color(c_white);
draw_set_alpha(1);

var len = 300;
var margin = 20;
draw_set_halign(fa_left);

for (var i = 0; i < ds_list_size(menu[menuSector]); i++) {
	var _menu = menu[menuSector];
	var _menuX = menuX[menuSector];
	var _menuY = menuY[menuSector];
	_menuX[| i] = scr_tween_to(_menuX[| i], lengthdir_x(len, -i * margin + menuSelect[menuSector] * margin) - 100, 0.4);
	_menuY[| i] = scr_tween_to(_menuY[| i], global.gameHeight / 2 + lengthdir_y(len, -i * margin + menuSelect[menuSector] * margin), 0.4);
	draw_set_alpha(1 - abs(menuSelect[menuSector] - i) / 3);
	draw_text_transformed(_menuX[| i], _menuY[| i], _menu[| i], 2, 2, 0);
	draw_set_alpha(1);
}
var _menuText = menuText[menuSector];
var _menuSprite = menuSprite[menuSector];
draw_sprite(_menuSprite[| menuSelect[menuSector]], 0, 900, global.gameHeight / 2 - 80);
draw_set_valign(fa_top);
draw_text(800, global.gameHeight / 2 + 80, string_hash_to_newline(_menuText[| menuSelect[menuSector]]));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);