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
            case "skill":
                switch (selection) {
                    case skills[0 + sCursor]:
                        if (sCursor == 0) { 
                            var length = array_length(skills) - 1, index = 0;
                            index = (length % 2 == 0) ? length : length-1;
                            while (index > 3) {
                                index -= 2;
                                sCursor += 2;
                            }
                            selection = skills[index + sCursor];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor -= 2;
                        selection = skills[0 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        if (sCursor == 0) { 
                            var length = array_length(skills) - 1, index = 0;
                            index = length;
                            while (index > 3) {
                                index -= 2;
                                sCursor += 2;
                            }
                            selection = skills[index + sCursor];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor -= 2;
                        selection = skills[1 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        playSound(sndCursor);
                        selection = skills[0 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        playSound(sndCursor);
                        selection = skills[1 + sCursor];
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
            case "skill":
                switch (selection) {
                    case skills[0 + sCursor]:
                        if (array_length(skills) <= 2 + sCursor) { break; }
                        playSound(sndCursor);
                        selection = skills[2 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        if (array_length(skills) <= 3 + sCursor) { break; }
                        playSound(sndCursor);
                        selection = skills[3 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        if (array_length(skills) <= 2 + sCursor + 2) { 
                            sCursor = 0;
                            selection = skills[0];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor += 2;
                        selection = skills[2 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        if (array_length(skills) <= 3 + sCursor + 2) { 
                            sCursor = 0;
                            selection = skills[1];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor += 2;
                        selection = skills[3 + sCursor];
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
            case "skill":
                switch (selection) {
                    case skills[0 + sCursor]:
                        selection = skills[1 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        selection = skills[0 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        selection = skills[3 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        selection = skills[2 + sCursor];
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
            case "skill":
                switch (selection) {
                    case skills[0 + sCursor]:
                        selection = skills[1 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        selection = skills[0 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        selection = skills[3 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        selection = skills[2 + sCursor];
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
                        selection = skills[0];
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