// camera step
// follows player closely but not perfectly to make it more lively
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var cam = view_camera[0];

if (target != -1) {
    xTo = target.x;
    yTo = target.y;
}

var coefficient = 15;
x += (xTo - x) / coefficient;
y += (yTo - y) / coefficient;
if (!global.battle.init && !global.battle.started)
    camera_set_view_pos(cam, floor(x - (CAM_WIDTH * 0.5) + 16), floor(y - (CAM_HEIGHT * 0.5) + 16));