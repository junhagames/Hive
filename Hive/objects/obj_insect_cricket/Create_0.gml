hpMax = 10;
hp = hpMax; 
spd = random_range(4, 6);
damage = 3;

target = obj_chr;
moveDelay = room_speed * 0.5;
moveDistance = 1200;

event_inherited();