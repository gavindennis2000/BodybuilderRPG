// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (opened) {
    if (image_speed == 0) {
        with (objController) 
            goToNextRoom();
    }
    image_speed = 1.2;
    handleDoors(id);
}