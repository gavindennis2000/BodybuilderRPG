// handles initial animations and pausing for guitar minigame

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var pause = input_check_pressed("start");
var left = input_check_pressed("left");
var right = input_check_pressed("right");
var confirm = input_check_pressed("south");

// check if the player has maxed fatigue
if (global.stats.fatigue >= 100 && !blackOut) {
    blackOut = true;
    deadY = 0;
    playSound(sndDeath);
    with (objPlayer) {
        alarm[4] = 180;
    }
    with(objMusic) {
        audio_stop_sound(workoutMusicLead);
        slowDown(workoutMusicBT);
    }
}
else if (blackOut) { exit; }

if (isExiting) {
    exitSpd *= 1.15;
    playerX += exitSpd;
    if (instance_exists(objPick)) { 
        with (objPick) { x -= other.exitSpd; }
    }
    if (playerX >= pFinalX + 960) {
        finishExit();
    }
    exit;
}

if (playerMove and playerX > pFinalX) {
    var dist = abs(playerX - pFinalX)/10;
    playerX -= dist;
    if (instance_exists(objPick)) { 
        with (objPick) { x += dist; }
    }
}

if (pause || (confirm && isPaused && selection == "no")) {
    // pause the minigame

    // make sure the game has started
    if (alarm_get(0) > 0) { exit; }

    // handle unpausing
    if (isPaused) {
        isPaused = false;
        alarm[3] = alarmTemp;
        objMusic.pauseGuitar();
        with (objNote) {
            visible = true;
            spd = other.pauseSpd;
        }
        image_speed = tempImgSpd;
    }
    // handle pausing
    else {
        isPaused = true;
        alarmTemp = alarm_get(3);
        debug($"Alarm temp: {alarmTemp}")
        alarm[3] = -1;
        selection = "no";
        objMusic.pauseGuitar();
        with (objNote) {
            visible = false;
            other.pauseSpd = spd;
            spd = 0;
        }
        tempImgSpd = image_speed;
        image_speed = 0;
    }
}

if ((left || right ) && isPaused) {
    // move the selection from yes to no when paused
    playSound(sndCursor);
    if (selection == "no") { selection = "yes"; }
    else { selection = "no"; }
}

if (confirm && isPaused && selection == "yes") {
    // sound effect
    playSound(sndDecline);

    // reset levelsToAdd
    levelsToAdd = 0;

    // exit minigame
    switch (global.workout) {
        case "novice leg":
            msg = ["Squat workout aborted."];
            break;
        case "intermediate push":
            msg = ["Bench press workout aborted."];
            break;
        case "advanced pull":
            msg = ["Bicep workout aborted."];
            break;
    }
    exitMinigame();
}