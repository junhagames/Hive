scr_init();

// 가상 조이스틱 초기화
if (os_type == os_android) {
	scr_vstick_init(VSTICK.MOVE, false, 240, 540, sprite_get_width(spr_joystick_move_back) / 2, spr_joystick_move_back, spr_joystick_move_front);
	scr_vstick_init(VSTICK.ATTACK, true, 1040, 540, sprite_get_width(spr_joystick_attack_back) / 2, spr_joystick_attack_back, spr_joystick_attack_front);
}