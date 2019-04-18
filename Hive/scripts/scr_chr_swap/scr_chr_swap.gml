/// @description 캐릭터 무기 교체

if (keyboard_check_pressed(vk_space)) {
	if (!isSwapDelay) {
		if (global.chrStatus[? "swap"] == SWAP.RANGER) {
			global.chrStatus[? "swap"] = SWAP.WARRIOR;
			alarm[ALARM_CHR.RELOAD] = 0;
		}
		else {
			global.chrStatus[? "swap"] = SWAP.RANGER;
			global.chrStatus[? "ammo"] = global.chrStatus[? "ammoMax"];
		}
		isSwapDelay = true;
		alarm[ALARM_CHR.SWAP] = swapSpeed;
		
		// TODO add swap skill
	}
}