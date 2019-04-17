hpMax = 10;
hp = hpMax; 
spd = random_range(3, 5);
damage = 3;

target = obj_chr;
path = path_add();
traceDelay = room_speed * 0.5;
traceDistance = 200;