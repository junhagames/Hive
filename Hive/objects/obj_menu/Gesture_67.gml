var diffX = event_data[? "guiposX"] - offsetX;
var diffY = event_data[? "guiposY"] - offsetY;
var marginX = 200;
var marginY = 80;

if (abs(diffX) > marginX && xAxis == 0) {
	xAxis = sign(diffX);
}

if (abs(diffY) > marginY) {
	offsetY = event_data[? "guiposY"];
	yAxis = sign(diffY);
}