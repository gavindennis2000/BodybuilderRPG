// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (target == noone) 
    exit;

var diffX = objPlayer.x - x;
var diffY = objPlayer.y - y; 

if ((diffX >= CAM_WIDTH || diffX <= -32) && xTo == -1) {
    xTo = x + sign(diffX) * CAM_WIDTH;
}
if ((diffY >= CAM_HEIGHT || diffY <= -32) && yTo == -1) {
    yTo = y + sign(diffY) * CAM_HEIGHT;
}

var changeAmount = 6;
if (x != xTo && xTo != -1) {
    if (round((xTo - x ) / changeAmount) == 0)
        x += sign(xTo - x);
    else
        x += round((xTo - x ) / changeAmount);
}
else {
    xTo = -1;
}

if (y != yTo && yTo != -1) {
    if (round((yTo - y ) / changeAmount) == 0)
        y += sign(yTo - y);
    else
        y += round((yTo - y ) / changeAmount);
}
else {
    yTo = -1;
}

// adjust the camera
camera_set_view_pos(view_camera[0], x, y);