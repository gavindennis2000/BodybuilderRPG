if (TEST) { if (live_call()) return live_result; }  // gmlive
    
var keyPause = input_check_pressed("start");

if (instance_exists(objPlayer)) {
	if (keyPause) {
		// pause the game
		if (!paused and !unpause  and objPlayer.canMove) {
			paused = true;
            selection = "status";
            screen = "status";
			with (objPlayer) { canMove = false; }
			alarm[0] = 1;
		}
		else if (paused && fadeBlack >= 1 and !unpause) {
			unpause = true;
			alarm[0] = 1;
		}
	}
}

// navigate the menu
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");
var confirm = input_check_pressed("south");
var cancel = input_check_pressed("east");

if (paused and !unpause) {
    if (keyRight) {
        playSound(sndCursor);
        switch(selection) {
            case "status":
                selection = "items";
                break;
            case "items":
                selection = "save";
                break;
            case "save":
                selection = "quit";
                break;
            case "quit":
                selection = "status";
                break;
        }
    }
    else if (keyLeft) {
        playSound(sndCursor);
        switch(selection) {
            case "status":
                selection = "quit";
                break;
            case "items":
                selection = "status";
                break;
            case "save":
                selection = "items";
                break;
            case "quit":
                selection = "save";
                break;
        }
    }
    else if (confirm) {
        playSound(sndCursor);
        switch(selection) {
            case "status":
                screen = "status";
                break;
            case "items":
                screen = "items";
                break;
            case "save":
                screen = "save";
                selection = "yes";
                break;
            case "quit":
                screen = "quit";
                break;
        }
    }
    else if (cancel) {
        if (screen == "status" && selection == "status") {
            playSound(sndError);
            exit;
        }
        playSound(sndDecline);
        switch(screen) {
            case "items":
                selection = "items";
                screen = "status";
                break;
            case "save":
                selection = "save";
                screen = "status";
                break;
            case "quit":
                screen = "status";
                selection = "quit";
                break;
            case "status":
                selection = "status";
                break;
        }
    }
}