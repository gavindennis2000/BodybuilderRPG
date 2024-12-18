/// @description Insert description here
// You can write your code in this editor

if (TEST) { if (live_call()) return live_result; }  // gmlive
var inc = 0.125;
var aTime = 1;

if (paused and !unpause) {
	if (fadeBlack < 1) {
		fadeBlack += inc;
        if (menuX > 0) { 
            if (menuX > 40) 
                menuX -= 125/2; 
            else
                while (menuX >= 10)
                    menuX -= 10;
        }
		alarm[0] = aTime;
	}
}
else if (unpause) {
	if (fadeBlack > 0) {
		fadeBlack -= inc;
        menuX += 125/2
		alarm[0] = aTime;
	}
	else {
		paused = false;
		unpause = false;
		with (objPlayer) { canMove = true; }
	}
}