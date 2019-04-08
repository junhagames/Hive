/// @description 캐릭터 무기 교체

if (mouse_check_button_pressed(mb_right) && !isAttackDelay) {
	if (global.chrStatus[? "swap"] == SWAP.RANGER) {
		global.chrStatus[? "swap"] = SWAP.WARRIOR;
	}
	else {
		global.chrStatus[? "swap"] = SWAP.RANGER;
	}
}