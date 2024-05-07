if (TEST)
	visible = true;
	
type = "exit";
goTo = -1;
pX = -1;
pY = -1;
face = -1;

function nextRoom() {
	room_goto(goTo);
	with (objPlayer) {
		x = other.pX;
		y = other.pY;
		face = other.face;
	}
}