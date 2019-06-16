var diffX = event_data[? "posX"] - offsetX;
var diffY = event_data[? "posY"] - offsetY;

var marginX = 200;
var marginY = 80;
if (abs(diffX) > marginX) {
	offsetX = event_data[? "posX"];
	xAxis = sign(diffX);
}
else {
	xAxis = 0;
}

if (abs(diffY) > marginY) {
	offsetY = event_data[? "posY"];
	yAxis = sign(diffY);

}
else {
	yAxis = 0;
}