/// @description 페이드 아웃 룸 전환 효과 생성
/// @param targetRoom

var targetRoom = argument0;

var transition = instance_create_layer(0, 0, "layer_system", obj_transition_fadeout);
transition.targetRoom = targetRoom;