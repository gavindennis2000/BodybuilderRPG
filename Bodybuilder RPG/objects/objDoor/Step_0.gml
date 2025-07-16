// objDoor step

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (opened) {
    if ((doorID == "gym left" || doorID == "gym right") && drawX < 32)
        with (objDoor) if (doorID == "gym left" || doorID == "gym right")
            drawX += 4;
    var sound = getSound(doorID);
    if (sound != -1 && !audio_is_playing(sound))
        playSound(sound);
    if (image_speed == 0) {
        handleDoors(id);
        with (objController) 
            goToNextRoom();
    }
    image_speed = 1.2;
}