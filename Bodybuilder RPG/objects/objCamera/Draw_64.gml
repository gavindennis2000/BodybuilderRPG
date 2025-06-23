// objCamera DrawGUI
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (battle) {
    // transition into the battle room

    // change the camera size and position
    var cam = view_camera[0];
    camera_set_view_size(cam, camera_get_view_width(cam) - 2, camera_get_view_height(cam) - 2);
    camera_set_view_pos(cam, camera_get_view_x(cam) + 1, camera_get_view_y(cam) + 1);

    // change the camera angle
    var viewAngle = camera_get_view_angle(cam);
    camera_set_view_angle(cam, viewAngle + camAngleChange);
    camAngleChange *= 1.09;

    // draw a white rectangle
    if (whiteOut < 1) {
        whiteOut += 0.02;
        if (whiteOut == 1) {
            // save the player's state and destroy its object
            global.roomChange.x = objPlayer.x;
            global.roomChange.y = objPlayer.y;
            global.roomChange.face = objPlayer.face;
            global.roomChange.room = room;
            instance_destroy(objPlayer);
            room_goto(rBattle);
        }
    }
}

if (room == rBattle) {
    // fade in the battle room

    // if (whiteOut == 1) {
    //     var zoomAmount = 200;
    //     var cam = view_camera[0];
    //     camera_set_view_size(cam, camera_get_view_width(cam) - zoomAmount, camera_get_view_height(cam) - zoomAmount);
    //     camera_set_view_pos(cam, camera_get_view_x(cam) + zoomAmount / 2, camera_get_view_y(cam) + zoomAmount / 2);
    //     debug(camera_get_view_x(cam));
    // }
    if (whiteOut > 0)
        whiteOut -= 0.02;

    var cam = view_camera[0];
    var amountChange = 5;
    if (camera_get_view_width(cam) < CAM_WIDTH) {
        camera_set_view_size(cam, camera_get_view_width(cam) + amountChange, camera_get_view_height(cam) + amountChange);
        camera_set_view_pos(cam, camera_get_view_x(cam) - amountChange / 2, camera_get_view_y(cam) - amountChange / 2);
    }
}

if (whiteOut > 0) {
    // white out the screen when required
    var getAlpha = draw_get_alpha();
    draw_set_alpha(whiteOut);
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(getAlpha);
}