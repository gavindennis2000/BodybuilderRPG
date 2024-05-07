global.roomVar = momB;
global.pX = x;
global.pY = y;

camX = 0;
camY = 0;

if (!file_exists("gamedata.txt")) {
	
	file = file_text_open_write("gamedata.txt");
	
}

displayRoom = false;
roomAlpha = 0;
theRoom = -1;