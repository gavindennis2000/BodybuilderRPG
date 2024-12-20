var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

if (playerMove and playerX > pFinalX) {
    var dist = abs(playerX - pFinalX)/10;
    playerX -= dist;
    if (instance_exists(objPick)) { 
        with (objPick) { x += dist; }
    }
}