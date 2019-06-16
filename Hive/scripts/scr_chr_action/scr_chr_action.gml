/// @description 캐릭터 상호작용

var list = ds_priority_create();
ds_priority_add(list, id, 1000000);

with (obj_stuff_supply) {
	if (!isUse) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

with (obj_stuff_heli) {
	if (!isUse) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

with (obj_parent_item) {
	if (!isSold) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}
stuff = ds_priority_find_min(list);
ds_priority_destroy(list);

if (distance_to_object(stuff) < 40) {
	isAction = true;
}
else {
	isAction = false;
}

if (isAction) {
	if ((os_type == os_windows && (keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left))) ||
		(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.PRESSED])) {
		with (stuff) {
			switch (object_index) {
				#region obj_stuff_supply
				case obj_stuff_supply:
					global.chrMap[? "upgradePart"] += irandom_range(3, 4);
					isUse = true;
					scr_vfx_text(x, y - sprite_height / 2, "잡동사니 " + string(global.chrMap[? "upgradePart"]), c_lime);
					break;
				#endregion
				#region obj_stuff_heli
				case obj_stuff_heli:
					var targetRoom;
					
					switch (global.currentWorld) {
						case "city":
							targetRoom = room_village_subway;
							break;
						case "swamp":
							targetRoom = room_village_camp;
							break;
						case "underground":
							targetRoom = room_village_terminal;
							break;
						case "jungle":
							targetRoom = room_village_bunker;
							break;
						case "desert":
							targetRoom = room_village_tunnel;
							break;	
					}
					isUse = true;
					scr_transition_fadeout(targetRoom);
					break;
				#endregion
				#region obj_item_potion_heal
				case obj_item_potion_heal:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "hp"] = global.chrMap[? "hpMax"];
						isSold = true;	
					}
					break;
				#endregion
			}
		}
	}
}