/*gmlive*/if (TEST) { if (live_call()) return live_result }; 

// move the selections
if (ready && !instance_exists(objTextbox) && turn == "player" && menuX == 0) {
    if input_check_pressed("up") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "attack":
                        if (array_length(global.inventory) > 0) { 
                            playSound(sndCursor);
                            selection = "item"; 
                        }
                        else 
                            { playSound(sndError); }
                        break;
                    case "item":
                        playSound(sndCursor);
                        selection = "attack";
                        break;
                    case "skill":
                        playSound(sndCursor);
                        selection = "escape";
                        break;
                    case "escape":
                        playSound(sndCursor);
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
            case "item":
                switch (selection) {
                    case inventory[0 + sCursor]:
                        if (sCursor == 0) { 
                            var length = array_length(inventory) - 1, index = 0;
                            index = (length % 2 == 0) ? length : length-1;
                            while (index > 3) {
                                index -= 2;
                                sCursor += 2;
                            }
                            selection = inventory[index + sCursor];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor -= 2;
                        selection = inventory[0 + sCursor];
                        break;
                    case inventory[1 + sCursor]:
                        if (sCursor == 0) { 
                            var length = array_length(skills) - 1, index = 0;
                            index = length;
                            while (index > 3) {
                                index -= 2;
                                sCursor += 2;
                            }
                            selection = inventory[index + sCursor];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor -= 2;
                        selection = inventory[1 + sCursor];
                        break;
                    case inventory[2 + sCursor]:
                        playSound(sndCursor);
                        selection = inventory[0 + sCursor];
                        break;
                    case inventory[3 + sCursor]:
                        playSound(sndCursor);
                        selection = inventory[1 + sCursor];
                        break;
                }
                break;
        }
    }
    else if input_check_pressed("down") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "attack":
                        if (array_length(global.inventory) > 0) { 
                            playSound(sndCursor);
                            selection = "item";
                        }
                        else 
                            { playSound(sndError); }
                        break;
                    case "item":
                        playSound(sndCursor);
                        selection = "attack";
                        break;
                    case "skill":
                        playSound(sndCursor);
                        selection = "escape";
                        break;
                    case "escape":
                        playSound(sndCursor);
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
            case "item":
                switch (selection) {
                    case inventory[0 + sCursor]:
                        if (array_length(inventory) <= 2 + sCursor) { break; }
                        playSound(sndCursor);
                        selection = inventory[2 + sCursor];
                        break;
                    case inventory[1 + sCursor]:
                        if (array_length(inventory) <= 3 + sCursor) { break; }
                        playSound(sndCursor);
                        selection = inventory[3 + sCursor];
                        break;
                    case inventory[2 + sCursor]:
                        if (array_length(inventory) <= 2 + sCursor + 2) { 
                            sCursor = 0;
                            selection = inventory[0];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor += 2;
                        selection = inventory[2 + sCursor];
                        break;
                    case inventory[3 + sCursor]:
                        if (array_length(inventory) <= 3 + sCursor + 2) { 
                            sCursor = 0;
                            selection = inventory[1];
                            break;
                        }
                        playSound(sndCursor);
                        sCursor += 2;
                        selection = inventory[3 + sCursor];
                        break;
                }
                break;
        }
    } 
    else if input_check_pressed("left") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "attack":
                        playSound(sndCursor);
                        selection = "skill";
                        break;
                    case "item":
                        playSound(sndCursor);
                        selection = "escape";
                        break;
                    case "skill":
                        playSound(sndCursor);
                        selection = "attack";
                        break;
                    case "escape":
                         if (array_length(global.inventory) > 0) { 
                            playSound(sndCursor);
                            selection = "item"; 
                        }
                        else 
                            { playSound(sndError); }
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
                        if (array_length(skills) > 1 + sCursor)
                            selection = skills[1 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        if (array_length(skills) > 0 + sCursor)
                            selection = skills[0 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        if (array_length(skills) > 3 + sCursor)
                            selection = skills[3 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        if (array_length(skills) > 2 + sCursor)
                            selection = skills[2 + sCursor];
                        break;
                }
                break;
            case "item":
                switch (selection) {
                    case inventory[0 + sCursor]:
                        if (array_length(inventory) > 1 + sCursor)
                            selection = inventory[1 + sCursor];
                        break;
                    case inventory[1 + sCursor]:
                        if (array_length(inventory) > 0 + sCursor)
                            selection = inventory[0 + sCursor];
                        break;
                    case inventory[2 + sCursor]:
                        if (array_length(inventory) > 3 + sCursor)
                            selection = inventory[3 + sCursor];
                        break;
                    case inventory[3 + sCursor]:
                        if (array_length(inventory) > 2 + sCursor)
                            selection = inventory[2 + sCursor];
                        break;
                }
                break;
        }
    } 
    else if input_check_pressed("right") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "attack":
                        playSound(sndCursor);
                        selection = "skill";
                        break;
                    case "item":
                        playSound(sndCursor);
                        selection = "escape";
                        break;
                    case "skill":
                        playSound(sndCursor);
                        selection = "attack";
                        break;
                    case "escape":
                         if (array_length(global.inventory) > 0) { 
                            playSound(sndCursor);
                            selection = "item"; 
                        }
                        else 
                            { playSound(sndError); }
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
                        if (array_length(skills) > 1 + sCursor)
                            selection = skills[1 + sCursor];
                        break;
                    case skills[1 + sCursor]:
                        if (array_length(skills) > 0 + sCursor)
                            selection = skills[0 + sCursor];
                        break;
                    case skills[2 + sCursor]:
                        if (array_length(skills) > 3 + sCursor)
                            selection = skills[3 + sCursor];
                        break;
                    case skills[3 + sCursor]:
                        if (array_length(skills) > 2 + sCursor)
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
                        selection = inventory[0];
                        break;
                    case "escape":
                        screen = selection;
                        selection = "yes";
                        break;
                }
                break;
            case "attack":
                // the sound effect
                playSound(sndCursor);

                // get the right string for the text box
                if (selection == attacks[0]) {
                    var str = string_concat(global.characterName, " attacks with a Boulder Shoulder Uppercut!");
                }
                else if (selection == attacks[1]) {
                    var str = string_concat(global.characterName, " attacks with a Big Back Smack!");
                }
                else {
                    var str = string_concat(global.characterName, " attacks with a Thunder Thigh Surprise!");
                }
                // perform the move
                move(selection);

                // create the textbox
                instance_create_layer(x, y, "Instances", objTextbox, {
                    npcID: "",
                    text: [str],
                });
                break;
            case "skill":
                // the sound effect
                playSound(sndCursor);

                // perform the move
                move(selection.name);

                break;
            case "item":
                 // the sound effect
                 playSound(sndCursor);

                 // use the item and go to the next turn
                 move("item");
                 
                break;
            case "escape":
                if (selection == "no") {
                    playSound(sndDecline);
                    screen = "menu";
                    selection = "escape";
                }
                else {  // yes
                    playSound(sndCursor);
                    
                    // change the player's sprite and animation speed
                    turn = "escape";
                    player.spr = sprPlayerLeft;
                    player.imgSpd = -1;
                    image_speed = 0.5;

                    // the textbox
                    var str = string_concat(global.characterName, " ran away!");
                    instance_create_layer(x, y, "Instances", objTextbox, {
                        npcID: "",
                        text: [str],
                        action: "escape battle"
                    });
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