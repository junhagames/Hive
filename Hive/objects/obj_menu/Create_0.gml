global.cursorSprite = spr_cursor_normal;

// 어플리케이션 서피스 복사
pauseSuf = surface_create(global.gameWidth, global.gameHeight);
surface_set_target(pauseSuf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
surface_copy(pauseSuf, 0, 0, application_surface);

// 일시정지 스프라이트 생성
pauseSprite = sprite_create_from_surface(pauseSuf, 0, 0, global.gameWidth, global.gameHeight, false, false, 0, 0);
surface_free(pauseSuf);

// 메뉴 설정 초기화
menuSector = 0;

menu[MENU.LIST] = ds_list_create();
ds_list_add(menu[MENU.LIST], "능력치");
ds_list_add(menu[MENU.LIST], "인벤토리");
ds_list_add(menu[MENU.LIST], "무기도감");
ds_list_add(menu[MENU.LIST], "도전과제");
ds_list_add(menu[MENU.LIST], "게임설정");
ds_list_add(menu[MENU.LIST], "게임종료");

menu[MENU.STATUS] = ds_list_create();
ds_list_add(menu[MENU.STATUS], "체력");
ds_list_add(menu[MENU.STATUS], "힘");
ds_list_add(menu[MENU.STATUS], "방어력");
ds_list_add(menu[MENU.STATUS], "이동속도");

menu[MENU.INVENTORY] = ds_list_create();
ds_list_add(menu[MENU.INVENTORY], "코인");
ds_list_add(menu[MENU.INVENTORY], "잡동사니");
ds_list_add(menu[MENU.INVENTORY], "총기부품");

menu[MENU.DICTIONARY] = ds_list_create();
ds_list_add(menu[MENU.DICTIONARY], "권총");
ds_list_add(menu[MENU.DICTIONARY], "데저트이글");
ds_list_add(menu[MENU.DICTIONARY], "UZI");
ds_list_add(menu[MENU.DICTIONARY], "산탄총");
ds_list_add(menu[MENU.DICTIONARY], "돌격소총");
ds_list_add(menu[MENU.DICTIONARY], "스나이퍼");
ds_list_add(menu[MENU.DICTIONARY], "미니건");
ds_list_add(menu[MENU.DICTIONARY], "화염방사기");
ds_list_add(menu[MENU.DICTIONARY], "알라봉");

menu[MENU.ACHIEVEMENTS] = ds_list_create();
ds_list_add(menu[MENU.ACHIEVEMENTS], "미구현");

menu[MENU.OPTION] = ds_list_create();
ds_list_add(menu[MENU.OPTION], "효과음");
ds_list_add(menu[MENU.OPTION], "배경음악");
ds_list_add(menu[MENU.OPTION], "전체화면");

for (var i = 0; i < array_length_1d(menu); i++) {
	menuX[i] = ds_list_create();
	menuY[i] = ds_list_create();
	menuText[i] = ds_list_create();
	menuSprite[i] = ds_list_create();
	
	for (var j = 0; j < ds_list_size(menu[i]); j++) {
		ds_list_add(menuX[i], 0);
		ds_list_add(menuY[i], 0);
		ds_list_add(menuText[i], "메뉴 구현예정");
		ds_list_add(menuSprite[i], spr_ui_menu_option);
	}
	menuSelect[i] = 0;
}

// 제스처 초기화
offsetX = 0;
offsetY = 0;
xAxis = 0;
yAxis = 0;

// 모든 인스턴스 비활성화 설정
instance_deactivate_all(true);
instance_activate_object(obj_system);