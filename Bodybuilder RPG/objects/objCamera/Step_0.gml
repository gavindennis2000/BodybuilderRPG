// objCamera step
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (target == noone || !instance_exists(objPlayer)) 
    exit;

var diffX = objPlayer.x - x;
var diffY = objPlayer.y - y; 

if ((diffX >= CAM_WIDTH || diffX <= -32) && xTo == -1) {
    xTo = x + sign(diffX) * CAM_WIDTH;
}
if ((diffY >= CAM_HEIGHT || diffY <= -32) && yTo == -1) {
    yTo = y + sign(diffY) * CAM_HEIGHT;
}

var changeAmount = 6;
if (x != xTo && xTo != -1) {
    if (round((xTo - x ) / changeAmount) == 0)
        x += sign(xTo - x);
    else
        x += round((xTo - x ) / changeAmount);
}
else {
    xTo = -1;
}

if (y != yTo && yTo != -1) {
    if (round((yTo - y ) / changeAmount) == 0)
        y += sign(yTo - y);
    else
        y += round((yTo - y ) / changeAmount);
}
else {
    yTo = -1;
}

// adjust the camera
camera_set_view_pos(view_camera[0], x, y);

if (room == rOverworld) {
    divX = (xTo != -1) ? xTo div CAM_WIDTH : x div CAM_WIDTH;
    divY = (yTo != -1) ? yTo div CAM_HEIGHT : y div CAM_HEIGHT;

    if (divX != prevDivX || divY != prevDivY) {
        prevDivX = divX;
        prevDivY = divY;

        // find which section of overworld the player is in
        if (divY == 0) {
            global.prevRoomVar = global.roomVar;
            global.roomVar = "Anabolic Heights";
        }
        else if (divX == 2 || divX == 3) {
            if (divY == 1 || divY == 2) {
                global.prevRoomVar = global.roomVar;
                global.roomVar = "Central Prairie";

                if (divX == 2 && divY == 1 && global.subRoomVar != "Northeast") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Northeast";
                    debug("hello");
                    with (objController)
                        showSubRoomVarFunc();
                }
                else if (divX == 3 && divY == 1 && global.subRoomVar != "Northwest") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Northwest";
                    with (objController)
                        showSubRoomVarFunc();
                }
                else if (divX == 2 && divY == 2 && global.subRoomVar != "Southeast") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Southeast";
                    with (objController)
                        showSubRoomVarFunc();
                }
                else if (divX == 3 && divY == 2 && global.subRoomVar != "Southwest") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Southwest";
                    with (objController)
                        showSubRoomVarFunc();
                }
            }
            else {
                global.prevRoomVar = global.roomVar;
                global.roomVar = "Wheyford";
                if (((divX == 2 && divY == 3) || divX == 3) && global.subRoomVar != "Shopping District") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Shopping District";
                    with (objController)
                        showSubRoomVarFunc();
                }
                else if (divX == 2 && divY == 4 && global.subRoomVar != "Affordable Living") {
                    global.prevSubRoomVar = global.subRoomVar;
                    global.subRoomVar = "Affordable Living";
                    with (objController)
                        showSubRoomVarFunc();
                }

            }
        }
        else if (divX == 0 || divX == 1) {
            global.prevRoomVar = global.roomVar;
            global.roomVar = "Creatine Cove";
        }
        else {
            global.prevRoomVar = global.roomVar;
            global.roomVar = "Leangroundburg";
        }

        // show the room var via objController
        with (objController)
            showRoomVarFunc();

        // play the right overworld music
        with (objMusic) {
            if (global.roomVar != global.prevRoomVar) {
                audio_sound_gain(global.songPlaying, 0.3, 600);
            getCurrentSong();
            // if (global.currentSong == global.previousSong)
            //     global.previousSong = -1;
            alarm_set(0, aTime * 2);
            }
        }
    }
}