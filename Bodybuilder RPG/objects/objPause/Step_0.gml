if (TEST) { if (live_call()) return live_result; }  // gmlive
    
var keyPause = input_check_pressed("start");

if (instance_exists(objPlayer)) {
	if (keyPause) {
		// pause the game
		if (!paused && !unpause && objPlayer.canMove && !objPlayer.cutscene && !instance_exists(objTextbox)) {
			paused = true;
            selection = "items";
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
var keyUp = input_check_pressed("up");
var keyDown = input_check_pressed("down");
var confirm = input_check_pressed("south");
var cancel = input_check_pressed("east");

if (paused and !unpause) {
    if (keyRight) {
        switch (screen) {
            case "items":
                playSound(sndCursor);
                switch (selection) {
                    case "inventory0":
                        selection = "inventory1";
                        break;
                    case "inventory2":
                        selection = "inventory3";
                        break;
                    case "inventory4":
                        selection = "inventory5";
                        break;
                    case "inventory6":
                        selection = "inventory7";
                        break;
                    case "inventory1":
                        selection = "key1";
                        break;
                    case "inventory3":
                        selection = "key2";
                        break;
                    case "inventory5":
                        selection = "key3";
                        break;
                    case "inventory7":
                        selection = "key4";
                        break;
                    case "key1":
                        selection = "inventory0";
                        break;
                    case "key2":
                        selection = "inventory2";
                        break;
                    case "key3":
                        selection = "inventory4";
                        break;
                    case "key4":
                        selection = "inventory6";
                        break;
                }
                
                // ensure that inventory item exists, otherwise move over
                if (string_length(selection) > 5) {
                    var char = string_char_at(selection, 10);
                    var inventoryIndex = real(char); 
                    var inventoryCount = array_length(global.inventory)-1;
                    if (inventoryIndex > inventoryCount) {
                        var selectionStr = string_concat("key", string(floor(inventoryIndex/2)+1));
                        selection = selectionStr;
                    }
                }
            
                break;
            case "prs":
            case "save":
                break;
            default:
                playSound(sndCursor);
                switch(selection) {
                    case "items":
                        selection = "equip";
                        break;
                    case "equip":
                        selection = "prs";
                        break;
                    case "prs":
                        selection = "save";
                        break;
                    case "save":
                        selection = "quit";
                        break;
                    case "quit":
                        selection = "items";
                        break;
                    case "yes":
                        selection = "no";
                        break;
                    case "no":
                        selection = "yes";
                        break;
                }
                break;
        }
    }
    else if (keyLeft) {
        switch (screen) {
            case "items":
                playSound(sndCursor);
                switch (selection) {
                    case "inventory0":
                        selection = "key1";
                        break;
                    case "inventory2":
                        selection = "key2";
                        break;
                    case "inventory4":
                        selection = "key3";
                        break;
                    case "inventory6":
                        selection = "key4";
                        break;
                    case "inventory1":
                        selection = "inventory0";
                        break;
                    case "inventory3":
                        selection = "inventory2";
                        break;
                    case "inventory5":
                        selection = "inventory4";
                        break;
                    case "inventory7":
                        selection = "inventory6";
                        break;
                    case "key1":
                        selection = "inventory1";
                        break;
                    case "key2":
                        selection = "inventory3";
                        break;
                    case "key3":
                        selection = "inventory5";
                        break;
                    case "key4":
                        selection = "inventory7";
                        break;
                }
            
                // ensure that inventory item exists, otherwise move over
                if (string_length(selection) > 5) {
                    var char = string_char_at(selection, 10);
                    var inventoryIndex = real(char); 
                    var inventoryCount = array_length(global.inventory)-1;
                    if (inventoryIndex > inventoryCount) {
                        if (inventoryIndex-1 <= inventoryCount)
                            selection = string_concat("inventory", inventoryIndex-1);
                        else {
                            selection = string_concat("key", string(floor(inventoryIndex/2)+1));
                        }
                    }
                }
            
                break;
            case "prs":
            case "save":
                break; 
            default:
                playSound(sndCursor);
                switch(selection) {
                    case "items":
                        selection = "quit";
                        break;
                    case "equip":
                        selection = "items";
                        break;
                    case "prs":
                        selection = "equip";
                        break;
                    case "save":
                        selection = "prs";
                        break;
                    case "quit":
                        selection = "save";
                        break;
                    case "yes":
                        selection = "no";
                        break;
                    case "no":
                        selection = "yes";
                        break;
                }
                break;
        }
    
    }
    else if (keyDown) {
        switch (screen) {
            case "items":
                playSound(sndCursor);
                switch (selection) {
                    case "inventory0":
                        selection = "inventory2";
                        break;
                    case "inventory2":
                        selection = "inventory4";
                        break;
                    case "inventory4":
                        selection = "inventory6";
                        break;
                    case "inventory6":
                        selection = "inventory0";
                        break;
                    case "inventory1":
                        selection = "inventory3";
                        break;
                    case "inventory3":
                        selection = "inventory5";
                        break;
                    case "inventory5":
                        selection = "inventory7";
                        break;
                    case "inventory7":
                        selection = "inventory1";
                        break;
                    case "key1":
                        selection = "key2";
                        break;
                    case "key2":
                        selection = "key3";
                        break;
                    case "key3":
                        selection = "key4";
                        break;
                    case "key4":
                        selection = "key1";
                        break;
                }
            
                // ensure that inventory item exists, otherwise move over
                if (string_length(selection) > 5) {
                    var char = string_char_at(selection, 10);
                    var inventoryIndex = real(char); 
                    var inventoryCount = array_length(global.inventory)-1;
                    if (inventoryIndex > inventoryCount) {
                        while (inventoryIndex > 1) inventoryIndex -=2; 
                        selection = string_concat("inventory", inventoryIndex);
                    }
                }
            
                break;
        }
    }
    else if (keyUp) {
        switch (screen) {
            case "items":
                playSound(sndCursor);
                switch (selection) {
                    case "inventory0":
                        selection = "inventory6";
                        break;
                    case "inventory2":
                        selection = "inventory0";
                        break;
                    case "inventory4":
                        selection = "inventory2";
                        break;
                    case "inventory6":
                        selection = "inventory4";
                        break;
                    case "inventory1":
                        selection = "inventory7";
                        break;
                    case "inventory3":
                        selection = "inventory1";
                        break;
                    case "inventory5":
                        selection = "inventory3";
                        break;
                    case "inventory7":
                        selection = "inventory5";
                        break;
                    case "key1":
                        selection = "key4";
                        break;
                    case "key2":
                        selection = "key1";
                        break;
                    case "key3":
                        selection = "key2";
                        break;
                    case "key4":
                        selection = "key3";
                        break;
                }
            
                // ensure that inventory item exists, otherwise move over
                if (string_length(selection) > 5) {
                    var char = string_char_at(selection, 10);
                    var inventoryIndex = real(char); 
                    var inventoryCount = array_length(global.inventory)-1;
                    if (inventoryIndex > inventoryCount) {
                        while (inventoryIndex > inventoryCount) inventoryIndex -=2; 
                        selection = string_concat("inventory", inventoryIndex);
                    }
                }
            
                break;
        }
    }
    else if (confirm) {
        switch (screen) {
            case "quit":
                playSound(sndCursor);
                switch (selection) {
                    case "yes":
                        if (instance_exists(objController)) {
                            objController.exitGame();
                        }
                        break;
                    case "no":
                        screen = "status";
                        selection = "quit";
                        break;
                }
                break;
            case "items":
                playSound(sndCursor);
                var keyItems = global.keyItems;
                switch (selection) {
                    case "key1":
                        if (!keyItems[0].value) {
                            audio_stop_sound(sndCursor);
                            playSound(sndError);
                            break;
                        }
                        break;
                    case "key2":
                        if (!keyItems[1].value) {
                            audio_stop_sound(sndCursor);
                            playSound(sndError);
                            break;
                        }
                        break;
                    case "key3":
                        if (!keyItems[2].value) {
                            audio_stop_sound(sndCursor);
                            playSound(sndError);
                            break;
                        }
                        break;
                    case "key4":
                        if (!keyItems[3].value) {
                            audio_stop_sound(sndCursor);
                            playSound(sndError);
                            break;
                        }
                        break;
                }
                break;
            case "equip":
            case "save":
                playSound(sndError);
                break;
            case "status":
            default:
                playSound(sndCursor);
                switch (selection) {
                    case "items":
                        screen = "items";
                        selection = (array_length(global.inventory) > 0) ? "inventory0" : "key1";
                        break;
                    case "equip":
                        screen = "equip";
                        selection = -1
                        break;
                    case "prs":
                        screen = "prs";
                        selection = -1;
                        break;
                    case "save":
                        screen = "save";
                        selection = -1
                        break;
                    case "quit":
                        screen = "quit";
                        selection = "no";
                        break;
                }
                break;
        }
    }
    else if (cancel) {
        if (screen == "status") {
            playSound(sndError);
            exit;
        }
        playSound(sndDecline);
        switch(screen) {
            case "items":
                selection = "items";
                screen = "status";
                break;
            case "equip":
                selection = "equip";
                screen = "status";
                break;
            case "prs":
                selection = "prs";
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
                break;
        }
    }
}