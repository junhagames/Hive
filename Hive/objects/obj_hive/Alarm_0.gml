/// @description 곤충 생성

hp -= 20;
isHit = true;

var insectList = global.objParentMap[? obj_parent_insect];
instance_create_layer(x, y + 1, "layer_inst", insectList[| irandom(ds_list_size(insectList) - 1)]);
alarm[ALARM_HIVE.SPAWN] = spawnSpeed;
alarm[ALARM_VFX.HIT] = room_speed * 0.1;