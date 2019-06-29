/// @description 캐릭터 상호작용

var list = ds_priority_create();
ds_priority_add(list, noone, 1000000);

var distance = 40;

with (obj_chest) {
	if (!isUse && distance_to_object(obj_chr) < distance) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

with (obj_supply) {
	if (!isUse && distance_to_object(obj_chr) < distance) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

with (obj_stuff_heli) {
	if (!isUse && distance_to_object(obj_chr) < distance) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}

with (obj_parent_item) {
	if (distance_to_object(obj_chr) < distance) {
		ds_priority_add(list, id, distance_to_object(obj_chr));
	}
}
stuff = ds_priority_find_min(list);
ds_priority_destroy(list);

if (distance_to_object(stuff) < distance) {
	if ((os_type == os_windows && (keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left))) ||
		(os_type == os_android && global.vkey[VKEY.ATTACK, VKEY_SETTING.PRESSED])) {
		with (stuff) {
			switch (object_index) {
				#region obj_chest
				case obj_chest:
					global.chrMap[? "coin"] += irandom_range(1, 2);
					isUse = true;
					scr_vfx_text(x, y - sprite_height / 2, "코인 " + string(global.chrMap[? "coin"]), c_yellow);
					break;
				#endregion
				#region obj_supply
				case obj_supply:
					global.chrMap[? "oddments"]++;
					global.chrMap[? "part"]++;
					isUse = true;
					scr_vfx_text(x, y - sprite_height / 2, "잡동사니 " + string(global.chrMap[? "oddments"]), c_lime);
					scr_vfx_text(x, y - sprite_height / 2 - 40, "부품 " + string(global.chrMap[? "part"]), c_fuchsia);
					break;
				#endregion
				#region obj_stuff_heli
				case obj_stuff_heli:
					var targetRoom = room_title;
					isUse = true;
					show_message_async("게임 클리어!");
					file_delete(SAVE_FILE); 
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
						global.chrMap[? "hpMax"] += 10;
						global.chrMap[? "hp"] += 10;
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
						global.chrMap[? "oddments"]++;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_part
				case obj_item_part:
					if (global.chrMap[? "coin"] >= price) {
						global.chrMap[? "part"]++;
						global.chrMap[? "coin"] -= price;
						isSold = true;	
					}
					break;
				#endregion
				#region obj_item_ranger
				case obj_item_ranger:
					if (global.chrMap[? "coin"] >= price) {
						switch (global.chrMap[? "rangerWeapon"]) {
							case "pistol":
								global.chrMap[? "rangerWeapon"] = "deagle";
								global.chrMap[? "rangerDamage"] = DEAGLE.DAMAGE;
								global.chrMap[? "rangerSpeed"] = DEAGLE.SPEED;
								global.chrMap[? "rangerAccuracy"] = DEAGLE.ACCURACY;
								global.chrMap[? "ammoMax"] = DEAGLE.AMMO;
								break;
							case "deagle":
								global.chrMap[? "rangerWeapon"] = "uzi";
								global.chrMap[? "rangerDamage"] = UZI.DAMAGE;
								global.chrMap[? "rangerSpeed"] = UZI.SPEED;
								global.chrMap[? "rangerAccuracy"] = UZI.ACCURACY;
								global.chrMap[? "ammoMax"] = UZI.AMMO;
								break;
							case "uzi":
								global.chrMap[? "rangerWeapon"] = "shotgun";
								global.chrMap[? "rangerDamage"] = SHOTGUN.DAMAGE;
								global.chrMap[? "rangerSpeed"] = SHOTGUN.SPEED;
								global.chrMap[? "rangerAccuracy"] = SHOTGUN.ACCURACY;
								global.chrMap[? "ammoMax"] = SHOTGUN.AMMO;
								break;
							case "shotgun":
								global.chrMap[? "rangerWeapon"] = "sniper";
								global.chrMap[? "rangerDamage"] = SNIPER.DAMAGE;
								global.chrMap[? "rangerSpeed"] = SNIPER.SPEED;
								global.chrMap[? "rangerAccuracy"] = SNIPER.ACCURACY;
								global.chrMap[? "ammoMax"] = SNIPER.AMMO;
								break;
						}
						global.chrMap[? "ammo"] =global.chrMap[? "ammoMax"];
						global.chrMap[? "coin"] -= price;
					}
					break;
				#endregion
				#region obj_item_warrior
				case obj_item_warrior:
					if (global.chrMap[? "coin"] >= price) {
						switch (global.chrMap[? "warriorWeapon"]) {
							case "bat":
								global.chrMap[? "warriorWeapon"] = "axe";
								global.chrMap[? "warriorDamage"] = AXE.DAMAGE;
								global.chrMap[? "warriorSpeed"] = AXE.SPEED;
								break;
							case "axe":
								global.chrMap[? "warriorWeapon"] = "crowbar";
								global.chrMap[? "warriorDamage"] = CROWBAR.DAMAGE;
								global.chrMap[? "warriorSpeed"] = CROWBAR.SPEED;
								break;
							case "crowbar":
								global.chrMap[? "warriorWeapon"] = "hammer";
								global.chrMap[? "warriorDamage"] = HAMMER.DAMAGE;
								global.chrMap[? "warriorSpeed"] = HAMMER.SPEED;
								break;
							case "hammer":
								global.chrMap[? "warriorWeapon"] = "plunger";
								global.chrMap[? "warriorDamage"] = PLUNGER.DAMAGE;
								global.chrMap[? "warriorSpeed"] = PLUNGER.SPEED;
								break;
							case "plunger":
								global.chrMap[? "warriorWeapon"] = "knife";
								global.chrMap[? "warriorDamage"] = KNIFE.DAMAGE;
								global.chrMap[? "warriorSpeed"] = KNIFE.SPEED;
								break;
							case "knife":
								global.chrMap[? "warriorWeapon"] = "chicken";
								global.chrMap[? "warriorDamage"] = CHICKEN.DAMAGE;
								global.chrMap[? "warriorSpeed"] = CHICKEN.SPEED;
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
		audio_play_sound(sfx_button_click, 10, false);
	}
}