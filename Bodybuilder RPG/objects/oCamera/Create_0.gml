// oCamera create 
// setup the camera at the start of each room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_exists(layer_get_id("camera")) ? layer_get_id("camera") : layer_create(-100, "camera");

// set up the room camera
var cam = view_camera[0];
if (!view_enabled) {
    view_visible[0] = true;
    view_enabled = true;
}
// camera_set_view_target(cam, self);
// camera_set_view_border(cam, CAM_WIDTH / 2, CAM_HEIGHT / 2);

// set the target to the player
target = (instance_exists(oPlayer)) ? oPlayer : -1; 
xTo = -1; 
yTo = -1;

// set the initial pos to the player
if (target != -1) {
    x = target.x;
    y = target.y;
}

// battle stuff
camAngleChange = 1.25;
camSizeChange = 1.001;
camColorAlpha = global.battle.started ? 1 : 0;
if (global.battle.started) {
    x = global.battle.camX;
    y = global.battle.camY;
    camera_set_view_pos(cam, floor(x - (CAM_WIDTH * 0.5) + 16), floor(y - (CAM_HEIGHT * 0.5) + 16));
    camera_set_view_size(cam, CAM_WIDTH, CAM_HEIGHT);
}

startBattle = function() {
    with (global.battle) {
        camX = other.x;
        camY = other.y;
    }
    debug("start battle");
}