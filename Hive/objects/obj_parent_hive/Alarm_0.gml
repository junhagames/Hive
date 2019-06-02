/// @description 곤충 생성

instance_create_layer(x, y, "layer_inst", spawnTo);
alarm[ALARM_HIVE.SPAWN] = spawnDelay;