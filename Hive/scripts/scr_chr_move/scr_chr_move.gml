/// @description 캐릭터 이동

var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

var _hspeed = (key_right - key_left) * global.chrStatus[? "speed"];
var _vspeed = (key_down - key_up) * global.chrStatus[? "speed"];
isMove = _hspeed != 0 || _vspeed != 0;

if (place_meeting(x + _hspeed, y, obj_block)) {
	while (!place_meeting(x + sign(_hspeed), y, obj_block)) {
		x += sign(_hspeed);
	}
	_hspeed = 0;
}

if (place_meeting(x, y + _vspeed, obj_block)) {
	while (!place_meeting(x, y + sign(_vspeed), obj_block)) {
		y += sign(_vspeed);
	}
	_vspeed = 0;
}

var moveDir = point_direction(0, 0, _hspeed, _vspeed);
x += lengthdir_x(abs(_hspeed), moveDir);
y += lengthdir_y(abs(_vspeed), moveDir);