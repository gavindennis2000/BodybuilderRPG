// objCamera room start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (instance_exists(objPlayer) && target == objPlayer) {
    // adjust the room view
    x = objPlayer.x; 
    y = objPlayer.y;

    while (x % CAM_WIDTH != 0)
        x--; 
    while (y % CAM_HEIGHT != 0)
        y--;

    xTo = x;
    yTo = y;
}

if (room == rBattle) {
    whiteOut = 1;
    // set the camera to zoomed in at the start of the battle
    var zoomAmount = 200;
    var cam = view_camera[0];
    camera_set_view_size(cam, camera_get_view_width(cam) - zoomAmount, camera_get_view_height(cam) - zoomAmount);
    camera_set_view_pos(cam, camera_get_view_x(cam) + zoomAmount / 2, camera_get_view_y(cam) + zoomAmount / 2);
}