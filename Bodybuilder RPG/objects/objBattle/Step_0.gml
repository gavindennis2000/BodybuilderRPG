/*gmlive*/if (TEST) { if (live_call()) return live_result }; 

// move the selections
if (ready && !instance_exists(objTextbox)) {
    if input_check_pressed("up") {
        switch (screen) {
            case "menu":
                playSound(sndCursor);
                switch (selection) {
                    case "attack":
                        selection = "item";
                        break;
                    case "item":
                        selection = "attack";
                        break;
                    case "skill":
                        selection = "escape";
                        break;
                    case "escape":
                        selection = "skill";
                        break;
                }
                break;
            case "attack":
                switch (selection) {
                    case attacks[0]:
                        selection = attacks[2];
                        break;
                    case attacks[2]:
                        selection = attacks[0];
                        break;
                    case attacks[1]:
                        break;
                }
                break;
        }
    }
    else if input_check_pressed("down") {
        switch (screen) {
            case "menu":
                playSound(sndCursor);
                switch (selection) {
                    case "attack":
                        selection = "item";
                        break;
                    case "item":
                        selection = "attack";
                        break;
                    case "skill":
                        selection = "escape";
                        break;
                    case "escape":
                        selection = "skill";
                        break;
                }
                break;
            case "attack":
                switch (selection) {
                    case attacks[0]:
                        selection = attacks[2];
                        break;
                    case attacks[2]:
                        selection = attacks[0];
                        break;
                    case attacks[1]:
                        break;
                }
                break;
        }
    } 
    else if input_check_pressed("left") {
        switch (screen) {
            case "menu":
                playSound(sndCursor);
                switch (selection) {
                    case "attack":
                        selection = "skill";
                        break;
                    case "item":
                        selection = "escape";
                        break;
                    case "skill":
                        selection = "attack";
                        break;
                    case "escape":
                        selection = "item";
                        break;
                }
                break;
            case "escape":
                playSound(sndCursor);
                switch (selection) {
                    case "yes":
                        selection = "no";
                        break;
                    case "no":
                        selection = "yes";
                        break;
                }
                break;
            case "attack":
                switch (selection) {
                    case attacks[0]:
                        selection = attacks[1];
                        break;
                    case attacks[1]:
                        selection = attacks[0];
                        break;
                    case attacks[2]:
                        break;
                }
                break;
        }
    } 
    else if input_check_pressed("right") {
        switch (screen) {
            case "menu":
                playSound(sndCursor);
                switch (selection) {
                    case "attack":
                        selection = "skill";
                        break;
                    case "item":
                        selection = "escape";
                        break;
                    case "skill":
                        selection = "attack";
                        break;
                    case "escape":
                        selection = "item";
                        break;
                }
                break;
            case "escape":
                playSound(sndCursor);
                switch (selection) {
                    case "yes":
                        selection = "no";
                        break;
                    case "no":
                        selection = "yes";
                        break;
                }
                break;
            case "attack":
                switch (selection) {
                    case attacks[0]:
                        selection = attacks[1];
                        break;
                    case attacks[1]:
                        selection = attacks[0];
                        break;
                    case attacks[2]:
                        break;
                }
                break;
        }
    } 

    // confirm and cancel
    // confirm
    if (input_check_pressed("south")) {
        switch (screen) {
            case "menu":
                playSound(sndCursor);
                switch (selection) {
                    case "attack":
                        screen = selection;
                        selection = attacks[0];
                        break;
                    case "skill":
                        screen = selection;
                        break;
                    case "item":
                        screen = selection;
                        break;
                    case "escape":
                        screen = selection;
                        selection = "yes";
                        break;
                }
                break;
            case "escape":
                if (selection == "no") {
                    playSound(sndDecline);
                    screen = "menu";
                    selection = "escape";
                }
                else {
                    playSound(sndCursor);
                    var str = string_concat(global.characterName, " ran away!");
                    instance_create_layer(x, y, "Instances", objTextbox, {
                        npcID: "",
                        text: [str, ""]
                    })
                }
                break;
        }
    }
    // cancel
    if (input_check_pressed("east")) {
        switch (screen) {
            case "attack":
            case "skill":
            case "item":
            case "escape":
                playSound(sndDecline);
                selection = screen;
                screen = "menu";
                break;
            case "menu":
                playSound(sndError);
                break;
        }
    }
}