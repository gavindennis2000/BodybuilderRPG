// oCamera create 
// setup the camera at the start of each room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// set up the room camera
var cam = view_camera[0];
debug($"viewport enabled: {view_enabled}");  // check if room has viewport enabled
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