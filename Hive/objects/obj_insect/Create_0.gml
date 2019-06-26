var insectList = global.objParentMap[? obj_parent_insect];
instance_create_layer(x, y, "layer_inst", insectList[| irandom(ds_list_size(insectList) - 1)]);
instance_destroy();