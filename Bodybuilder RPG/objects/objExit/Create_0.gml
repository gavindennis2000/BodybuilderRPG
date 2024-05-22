if (TEST)
	visible = true;
	
depth = -10;

type = "exit";
goTo = -1;
pX = -1;
pY = -1;
face = -1;
drawAlpha = 0;
tempAlpha = -1;

function nextRoom() {
	global.playerCanMove = false;
	drawAlpha += 0.1;
	alarm[0] = 2;
	
}