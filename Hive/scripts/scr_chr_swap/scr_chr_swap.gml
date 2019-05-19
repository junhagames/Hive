/// @description 캐릭터 무기 교체

if (keyboard_check_pressed(ord("Q")) || mouse_wheel_up() || mouse_wheel_down()) {
	if (!isSwapDelay) {
		if (global.chrMap[? "swap"] == "ranger") {
			global.chrMap[? "swap"] = "warrior";
			warriorDir = 1;
		}
		else if (global.chrMap[? "swap"] == "warrior") {
			global.chrMap[? "swap"] = "ranger";
		}
		isSwapDelay = true;
		alarm[ALARM_CHR.SWAP] = swapSpeed;
	}
}