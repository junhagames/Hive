scr_init();

scr_vstick_init(VSTICK.MOVE, false, 240, 540, sprite_get_width(spr_joystick_back) / 2, spr_joystick_back, spr_joystick_front);
scr_vstick_init(VSTICK.ATTACK, true, 1040, 540, sprite_get_width(spr_joystick_back) / 2, spr_joystick_back, spr_joystick_front);
