if (global.chrStatus[? "rangerAmmo"] < global.chrStatus[? "rangerAmmoMax"]) {
	global.chrStatus[? "rangerAmmo"]++;
	alarm[1] = 10;
}