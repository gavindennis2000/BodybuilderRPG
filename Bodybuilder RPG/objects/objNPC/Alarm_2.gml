/*gmlive*/if (TEST) { if (live_call()) return live_result; }

switch (npcID) {
    case "samuel":
        // samuel exits the screen
        if (targetY == -1) {
            targetY = y + 128;
            face = "down";
            faceStart = "down";
            image_speed = 0.1;
            debug(targetY-y);
            alarm[2] = 1;
        }
        else if (y != targetY) {
            y++;
            alarm[2] = 1;
        }
        // destroy samuel's instance
        else if (targetY == y) {
            global.cutscene = false; 
            objPlayer.cutscene = false;
            // end samuel's theme
            with (objMusic) {
                endCutscene();
            }
            instance_destroy();
            with (objPlayer) {
                canMove = true;
            }
        }
        break;
    
    default:
        break;
}