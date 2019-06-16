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
ds_list_add(menu[MENU.LIST], "캐릭터 스탯");
ds_list_add(menu[MENU.LIST], "무기 도감");
ds_list_add(menu[MENU.LIST], "도전과제");
ds_list_add(menu[MENU.LIST], "게임 옵션");
ds_list_add(menu[MENU.LIST], "게임종료");

menu[MENU.STATUS] = ds_list_create();
ds_list_add(menu[MENU.STATUS], "체력");
ds_list_add(menu[MENU.STATUS], "힘");
ds_list_add(menu[MENU.STATUS], "방어력");
ds_list_add(menu[MENU.STATUS], "이동속도");

menu[MENU.DICTIONARY] = ds_list_create();
ds_list_add(menu[MENU.DICTIONARY], "권총");
ds_list_add(menu[MENU.DICTIONARY], "리볼버");
ds_list_add(menu[MENU.DICTIONARY], "샷건");
ds_list_add(menu[MENU.DICTIONARY], "치킨");

menu[MENU.ACHIEVEMENTS] = ds_list_create();
ds_list_add(menu[MENU.ACHIEVEMENTS], "학살의 시작");
ds_list_add(menu[MENU.ACHIEVEMENTS], "고자라니!!");
ds_list_add(menu[MENU.ACHIEVEMENTS], "고라니샷");
ds_list_add(menu[MENU.ACHIEVEMENTS], "투스타!");

menu[MENU.OPTION] = ds_list_create();
ds_list_add(menu[MENU.OPTION], "효과음");
ds_list_add(menu[MENU.OPTION], "배경음악");

for (var i = 0; i < array_length_1d(menu); i++) {
	menuX[i] = ds_list_create();
	menuY[i] = ds_list_create();
	menuText[i] = ds_list_create();
	menuSprite[i] = ds_list_create();
	
	for (var j = 0; j < ds_list_size(menu[i]); j++) {
		ds_list_add(menuX[i], 0);
		ds_list_add(menuY[i], 0);
		ds_list_add(menuText[i], "개기모띠한 매뉴입니다#아주 기모띠하죠#히히히히히 미나리아");
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