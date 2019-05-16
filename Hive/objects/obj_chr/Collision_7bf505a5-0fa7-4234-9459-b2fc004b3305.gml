switch (global.currentWorld) {
	case "city":
		room_goto(room_village_subway);
		break;
	case "swamp":
		room_goto(room_village_camp);
		break;
	case "underground":
		room_goto(room_village_terminal);
		break;
	case "jungle":
		room_goto(room_village_bunker);
		break;
	case "desert":
		room_goto(room_village_tunnel);
		break;	
}