/// @description 캐릭터 이동

var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

chr_hspeed = (key_right - key_left) * chr_moveSpeed;
chr_vspeed = (key_down - key_up) * chr_moveSpeed;

if (place_meeting(x + chr_hspeed, y, obj_block)) {
	while (!place_meeting(x + sign(chr_hspeed), y, obj_block)) {
		x += sign(chr_hspeed);
	}
	chr_hspeed = 0;
}

if (place_meeting(x, y + chr_vspeed, obj_block)) {
	while (!place_meeting(x, y + sign(chr_vspeed), obj_block)) {
		y += sign(chr_vspeed);
	}
	chr_vspeed = 0;
}

x += chr_hspeed;
y += chr_vspeed;