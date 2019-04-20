hpMax = 10;
hp = hpMax; 
spd = random_range(5, 7);
damage = 3;

target = obj_chr;
path = path_add();
moveDelay = room_speed * 0.5;
moveDistance = 1000;