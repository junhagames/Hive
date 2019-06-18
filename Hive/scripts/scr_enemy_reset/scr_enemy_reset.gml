/// @description 적 초기화
/// @param name
/// @param hpMax
/// @param moveSpeed
/// @param damage
/// @param target
/// @param alertDistance

name = argument0;
hpMax = argument1;
moveSpeed = argument2;
damage = argument3;
target = argument4;
alertDistance = argument5;

hp = hpMax;
state = STATE.WANDER;
counter = 0;
dir = random(360);
moveX = 0;
moveY = 0;