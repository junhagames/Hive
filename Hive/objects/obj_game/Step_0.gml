// 일시정지|매뉴 열기
if (os_type == os_android && global.vkey[VKEY.MENU, VKEY_SETTING.PRESSED]) {
	instance_create_layer(0, 0, "layer_system", obj_menu);
}