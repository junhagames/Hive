hpMax = 11;
hp = hpMax; 
moveSpeed = random_range(4, 6);
damage = 2;

target = obj_chr;
moveDelay = room_speed * 0.5;
moveDistance = 1200;

event_inherited();