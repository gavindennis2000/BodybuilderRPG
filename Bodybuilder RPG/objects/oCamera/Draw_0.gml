/*gmlive*/ if (TEST) { if (live_call()) return live_result; }
if (global.battle.init) {
    debug("working")
    var cam = view_camera[0];
    var camW = camera_get_view_width(cam);
    var camH = camera_get_view_height(cam);
    var camAngle = camera_get_view_angle(cam);
    camera_set_view_angle(cam, camAngle + camAngleChange);
    camAngleChange *= 1.06;
    camSizeChange *= 1.0015;

    camera_set_view_size(cam, camW / camSizeChange, camH / camSizeChange);
    camera_set_view_pos(cam, x - (camW * 0.5) + 16, y - (camH * 0.5) + 16);

    camColorAlpha += 0.01;
    if (camColorAlpha >= 1) {
        with (global.battle) {
            init = false; 
            started = true;
        }
        debug(global.battle);
        room_restart();
    }
}
else if (global.battle.started) {
    x = global.battle.camX; 
    y = global.battle.camY;

    if (camColorAlpha > 0)
        camColorAlpha -= 0.02;

}

// white out the screen
var getAlpha = draw_get_alpha();
draw_set_alpha(camColorAlpha);
draw_rectangle_color(-0.5 * CAM_WIDTH, -0.5 * CAM_HEIGHT, CAM_WIDTH * 1.5, CAM_HEIGHT * 1.5, c_white, c_white, c_white, c_white, false);
draw_set_alpha(getAlpha);