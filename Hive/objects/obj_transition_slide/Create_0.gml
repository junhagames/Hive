switch (global.previousPos) {
	case POS.TOP:
	case POS.TOP_LEFT:
	case POS.TOP_RIGHT:
		xTo = 0;
		yTo = global.gameHeight;
		break;
	case POS.RIGHT:
	case POS.RIGHT_TOP:
	case POS.RIGHT_BOTTOM:
		xTo = -global.gameHeight;
		yTo = 0;
		break;
	case POS.BOTTOM:
	case POS.BOTTOM_RIGHT:
	case POS.BOTTOM_LEFT:
		xTo = 0;
		yTo = -global.gameHeight;
		break;
	case POS.LEFT:
	case POS.LEFT_BOTTOM:
	case POS.LEFT_TOP:
		xTo = +global.gameHeight;
		yTo = 0;
		break;
}

oldRoomSuf = surface_create(global.gameWidth, global.gameHeight);
surface_copy(oldRoomSuf, 0, 0, application_surface);

newRoomSuf = surface_create(global.gameWidth, global.gameHeight);