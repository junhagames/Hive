sprite_delete(pauseSprite);

for (var i = 0; i < array_length_1d(menu); i++) {
	ds_list_destroy(menuX[i]);
	ds_list_destroy(menuY[i]);
	ds_list_destroy(menuText[i]);
	ds_list_destroy(menuSprite[i]);
}
instance_activate_all();