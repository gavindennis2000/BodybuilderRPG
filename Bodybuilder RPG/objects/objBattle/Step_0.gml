/*gmlive*/if (TEST) { if (live_call()) return live_result }; 

// move the selections
if (ready && !instance_exists(objTextbox)) {
    if input_check_pressed("up") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "movement":
                        selection = "item";
                        break;
                    case "item":
                        selection = "movement";
                        break;
                    case "flex":
                        selection = "escape";
                        break;
                    case "escape":
                        selection = "flex";
                        break;
                }
                break;
        }
    }
    else if input_check_pressed("down") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "movement":
                        selection = "item";
                        break;
                    case "item":
                        selection = "movement";
                        break;
                    case "flex":
                        selection = "escape";
                        break;
                    case "escape":
                        selection = "flex";
                        break;
                }
                break;
        }
    } 
    else if input_check_pressed("left") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "movement":
                        selection = "flex";
                        break;
                    case "item":
                        selection = "escape";
                        break;
                    case "flex":
                        selection = "movement";
                        break;
                    case "escape":
                        selection = "item";
                        break;
                }
                break;
            case "escape":
                switch (selection) {
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
    else if input_check_pressed("right") {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "movement":
                        selection = "flex";
                        break;
                    case "item":
                        selection = "escape";
                        break;
                    case "flex":
                        selection = "movement";
                        break;
                    case "escape":
                        selection = "item";
                        break;
                }
                break;
            case "escape":
                switch (selection) {
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

    // confirm and cancel
    // confirm
    if (input_check_pressed("south")) {
        switch (screen) {
            case "menu":
                switch (selection) {
                    case "movement":
                        screen = selection;
                        break;
                    case "flex":
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
                    screen = "menu";
                    selection = "escape";
                }
                else {
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
            case "movement":
            case "flex":
            case "item":
            case "escape":
                selection = screen;
                screen = "menu";
                break;
        }
    }
}