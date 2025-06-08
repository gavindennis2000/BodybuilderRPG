// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

var lastIndex = sprite_get_number(sprite_index) - 1
if (opened == 1) {
    opened = 2;
    // image_index = -1;
    image_speed = 1;
    handleDoors(id);
    with (objController)
        goToNextRoom();
}
else if (opened = 2) {
    if (image_index == lastIndex) {
        image_speed = 0;
        image_index = lastIndex;
    }
}
else {
    image_index = 0;
    image_speed = 0;
}