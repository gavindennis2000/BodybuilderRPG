// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

image_speed = 0;
opened = false;
drawX = 0;

getSound = function(doorID) {
    switch (doorID) {
        case "upstairs":
        case "downstairs":
            return -1;
        case "gym left":
        case "gym right":
            return -1;
        default:
            return sndDoor;
    }
}