if (global.chrStatus[? "rangerAmmo"] < global.chrStatus[? "rangerAmmoMax"]) {
	global.chrStatus[? "rangerAmmo"]++;
	alarm[1] = room_speed * 0.1;
}