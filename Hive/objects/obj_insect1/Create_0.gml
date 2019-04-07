instance_kind = obj_insect1;

hpMax = 20;
hp = hpMax; 
_speed = random_range(3, 5);
damage = 5;

path = path_add();
followTime = room_speed * 0.5;
followDistance = 0;
alarm[0] = 1;