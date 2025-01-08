/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (input_check_pressed("up")) {
    switch (screen) {
        case "menu":
            switch(selection) {
                case "new game":
                    playSound(sndCursor);
                    selection = "continue"
                    break;
                case "continue":
                    playSound(sndCursor);
                    selection = "new game";
            }
            break;
        case "new game":
            break;
    }
}
else if (input_check_pressed("down")) {
    switch (screen) {
        case "menu":
            switch(selection) {
                case "new game":
                    playSound(sndCursor);
                    selection = "continue"
                    break;
                case "continue":
                    playSound(sndCursor);
                    selection = "new game";
            }
            break;
        case "new game":
            break;
    }
}
else if (input_check_pressed("south")) {  // confirm
    //
    switch (screen) {
        case "menu":
            switch (selection) {
                case "new game":
                    playSound(sndCursor);
                    screen = "new game";
                    selection = "";
                    break;
                case "continue":
                    playSound(sndCursor);
                    screen = "continue";
                    selection = "";
                    break;
            }
    }
}
else if (input_check_pressed("east")) {  // cancel
    //
    switch (screen) {
        case "menu":
            playSound(sndError);
            break;
        case "new game":
        case "continue":
            playSound(sndDecline);
            selection = screen;
            screen = "menu";
            break;
    }
}
