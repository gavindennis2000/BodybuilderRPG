// create the picks

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

for (var i = 3; i <= 6; i++) {
	instance_create_layer(camX - 32*i, camY + 270*3/4, layer, objPick, {findTrigger: i-2});
}
playerMove = true;