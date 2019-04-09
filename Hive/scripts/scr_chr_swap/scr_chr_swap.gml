/// @description 캐릭터 무기 교체

if (keyboard_check_pressed(vk_space)) {
	if (global.chrStatus[? "swap"] == SWAP.RANGER) {
		global.chrStatus[? "swap"] = SWAP.WARRIOR;
	}
	else {
		global.chrStatus[? "swap"] = SWAP.RANGER;
	}
}