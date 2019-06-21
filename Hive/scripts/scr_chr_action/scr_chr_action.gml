/// @description 캐릭터 상호작용

var list = ds_priority_create();
ds_priority_add(list, id, 1000000);

with (obj_stuff_chest) {
	if (!isUse) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

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
				#region obj_stuff_chest
				case obj_stuff_chest:
					global.chrMap[? "coin"] += irandom_range(1, 3);
					isUse = true;
					scr_vfx_text(x, y - sprite_height / 2, "코인 " + string(global.chrMap[? "coin"]), c_yellow);
					break;
				#endregion
				#region obj_stuff_supply
				case obj_stuff_supply:
					global.chrMap[? "oddments"] += irandom_range(5, 10);
					global.chrMap[? "part"] += irandom_range(1, 3);
					isUse = true;
					scr_vfx_text(x, y - sprite_height / 2, "잡동사니 " + string(global.chrMap[? "oddments"]), c_lime);
					scr_vfx_text(x, y - sprite_height / 2 - 40, "부품 " + string(global.chrMap[? "part"]), c_fuchsia);
					break;
				#endregion
				#region obj_stuff_heli
				case obj_stuff_heli:
					var targetRoom = room_title;
					
					//switch (global.currentWorld) {
					//	case "city":
					//		targetRoom = room_village_subway;
					//		break;
					//	case "swamp":
					//		targetRoom = room_village_camp;
					//		break;
					//	case "underground":
					//		targetRoom = room_village_terminal;
					//		break;
					//	case "jungle":
					//		targetRoom = room_village_bunker;
					//		break;
					//	case "desert":
					//		targetRoom = room_village_tunnel;
					//		break;	
					//}
					isUse = true;
					show_message_async("게임 클리어!");
					scr_transition_fadeout(targetRoom);
					break;
				#endregion
				#region Potion shop
				#region obj_item_potion_healsmall
				case obj_item_potion_healsmall:
					if (global.chrMap[? "coin"] >= price) {
						if (global.chrMap[? "hp"] < global.chrMap[? "hpMax"]) {
							global.chrMap[? "hp"] = min(global.chrMap[? "hp"] + floor(global.chrMap[? "hpMax"] / 100 * 30), global.chrMap[? "hpMax"]);
							global.chrMap[? "coin"] -= price;
							isSold = true;
						}
					}
					break;
				#endregion
				#region obj_item_potion_healbig
				case obj_item_potion_healbig:
					if (global.chrMap[? "coin"] >= price) {
						if (global.chrMap[? "hp"] < global.chrMap[? "hpMax"]) {
							global.chrMap[? "hp"] = min(global.chrMap[? "hp"] + floor(global.chrMap[? "hpMax"] / 100 * 70), global.chrMap[? "hpMax"]);
							global.chrMap[? "coin"] -= price;
							isSold = true;
						}
					}
					break;
				#endregion
				#region obj_item_potion_hpmax
				case obj_item_potion_hpmax:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "hpMax"] += 5;
						global.chrMap[? "hp"] += 5;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_potion_power
				case obj_item_potion_power:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "power"]++;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_potion_armor
				case obj_item_potion_armor:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "armor"] += 1;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_potion_speed
				case obj_item_potion_speed:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "moveSpeed"] += 0.5;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#endregion
				#region Weapon shop
				#region obj_item_oddments
				case obj_item_oddments:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "oddments"] += 5;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_part
				case obj_item_part:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "part"] += 1;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_weapon
				case obj_item_weapon:
					if (global.chrMap[? "coin"] >= price) {
						switch (global.chrMap[? "warriorWeapon"]) {
							case "bat":
								global.chrMap[? "warriorWeapon"] = "axe";
								global.chrMap[? "warriorDamage"] = 10;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
								break;
							case "axe":
								global.chrMap[? "warriorWeapon"] = "crowbar";
								global.chrMap[? "warriorDamage"] = 15;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.2;
								break;
							case "crowbar":
								global.chrMap[? "warriorWeapon"] = "hammer";
								global.chrMap[? "warriorDamage"] = 20;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.3;
								break;
							case "hammer":
								global.chrMap[? "warriorWeapon"] = "plunger";
								global.chrMap[? "warriorDamage"] = 4;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.1;
								break;
							case "plunger":
								global.chrMap[? "warriorWeapon"] = "knife";
								global.chrMap[? "warriorDamage"] = 20;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.2;
								break;
							case "knife":
								global.chrMap[? "warriorWeapon"] = "chicken";
								global.chrMap[? "warriorDamage"] = 20;
								global.chrMap[? "warriorSpeed"] = room_speed * 0.1;
								isSold = true;
								break;
						}
						global.chrMap[? "coin"] -= price;
					}
					break;
				#endregion
				#endregion
			}
		}
	}
}