// door step 
// check contact with player and go to the next room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (opened)
    exit;

if (instance_exists(oPlayer) && oPlayer.x == x && oPlayer.y == y) {
    // if the player enters the door, set the info for the new room and instruct the game controller to go there
    opened = true;
    oPlayer.canMove = false;
    global.playerSpawn = doorInfo;
    debug(global.playerSpawn);
    with (oController) {
        gotoNextRoom();
    }
}