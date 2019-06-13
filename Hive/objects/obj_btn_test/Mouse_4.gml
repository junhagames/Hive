if (!instance_exists(obj_transition_fadeout)) {
	scr_world_reset("city", 0, 1, 1);
	scr_chr_reset("commando", 100, 2, 1, 5, room_speed * 10, "degle", 5, room_speed * 0.2, 4, 15, "plunger", 3, room_speed * 0.1);
	scr_transition_fadeout(room_test);
}