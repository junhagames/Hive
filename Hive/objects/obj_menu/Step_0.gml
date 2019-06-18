if ((os_type == os_windows && (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || mouse_wheel_down())) ||
	(os_type == os_android && yAxis == -1)) {
	menuSelect[menuSector] = min(menuSelect[menuSector] + 1, ds_list_size(menu[menuSector]) - 1);
	yAxis = 0;
}

if ((os_type == os_windows && (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || mouse_wheel_up())) ||
	(os_type == os_android && yAxis == 1)) {
	menuSelect[menuSector] = max(menuSelect[menuSector] - 1, 0);
	yAxis = 0;
}

if ((os_type == os_windows && (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("D")) || mouse_check_button_pressed(mb_left))) ||
	(os_type == os_android && xAxis == -1)) {
	switch (menuSector) {
		#region List
		case MENU.LIST:
			switch (menuSelect[menuSector]) {
				case MENU_LIST.STATUS:
					menuSector = MENU.STATUS;
					break;
				case MENU_LIST.INVENTORY:
					menuSector = MENU.INVENTORY;
					break;
				case MENU_LIST.DICTIONARY:
					menuSector = MENU.DICTIONARY;
					break;
				case MENU_LIST.ACHIEVEMENTS:
					menuSector = MENU.ACHIEVEMENTS;
					break;
				case MENU_LIST.OPTION:
					menuSector = MENU.OPTION;
					break;
				case MENU_LIST.EXIT:
					room_goto(room_title);
					break;
			}
			break;
		#endregion
	}
	xAxis = 2;
}

if ((os_type == os_windows && (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("A")) || mouse_check_button_pressed(mb_right))) ||
	(os_type == os_android && xAxis == 1)) {
	for (var i = 0; i < ds_list_size(menu[menuSector]); i++) {
		var _menuX = menuX[menuSector];
		var _menuY = menuY[menuSector];
		_menuX[| i] = 0;
		_menuY[| i] = 0;
	}
	
	if (menuSector == MENU.LIST) {
		instance_destroy();
	}
	else {
		menuSector = MENU.LIST;
		
		for (var i = 0; i < ds_list_size(menu[menuSector]); i++) {
			var _menuX = menuX[menuSector];
			var _menuY = menuY[menuSector];
			_menuX[| i] = 0;
			_menuY[| i] = 0;
		}
	}
	xAxis = 2;
}