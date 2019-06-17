if (event_data[? "guiposX"] > global.gameWidth / 2) {
	xAxis = -1;
}
else if (event_data[? "guiposY"] < global.gameHeight / 2) {  
	yAxis = 1;
}
else {
	yAxis = -1;
}