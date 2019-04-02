/// @description 캐릭터 이동

var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

chr_hspeed = (key_right - key_left) * chr_moveSpeed;
chr_vspeed = (key_down - key_up) * chr_moveSpeed;
chr_isMove = chr_hspeed != 0 || chr_vspeed != 0;

if (place_meeting(x + chr_hspeed, y, Block)) {
	while (!place_meeting(x + sign(chr_hspeed), y, Block)) {
		x += sign(chr_hspeed);
	}
	chr_hspeed = 0;
}

if (place_meeting(x, y + chr_vspeed, Block)) {
	while (!place_meeting(x, y + sign(chr_vspeed), Block)) {
		y += sign(chr_vspeed);
	}
	chr_vspeed = 0;
}

var moveDir = point_direction(0, 0, chr_hspeed, chr_vspeed);
x += lengthdir_x(abs(chr_hspeed), moveDir);
y += lengthdir_y(abs(chr_vspeed), moveDir);