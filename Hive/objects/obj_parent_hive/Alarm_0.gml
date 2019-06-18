/// @description 곤충 생성

hp -= 20;
instance_create_layer(x, y + 1, "layer_inst", spawnTo);
alarm[ALARM_HIVE.SPAWN] = spawnDelay;

isHit = true;
alarm[ALARM_VFX.HIT] = room_speed * 0.1;