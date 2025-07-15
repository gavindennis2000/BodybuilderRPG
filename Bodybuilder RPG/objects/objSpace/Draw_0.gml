/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// draw some stars

depth = 100;

var getAlpha = draw_get_alpha();
draw_set_alpha(0.5);

for (var i = 0; i < CAM_WIDTH; i += 128) {
    for (var j = 0; j < CAM_HEIGHT; j += 144) {
        var starSize = 0.5;
        var x1 = camera_get_view_x(view_camera[0]) + i + starX;
        while (x1 >= camera_get_view_x(view_camera[0]) + CAM_WIDTH)
            x1 -= CAM_WIDTH;
        var x2 = x1 + starSize;
        var y1 = camera_get_view_y(view_camera[0]) + j + starY;
        while (y1 >= camera_get_view_y(view_camera[0]) + CAM_HEIGHT)
            y1 -= CAM_HEIGHT;
        var y2 = y1 + starSize;
        draw_rectangle_color(x1, y1, x2, y2, c_white, c_white, c_white, c_white, false);
    }
}
for (var i = 64; i < CAM_WIDTH; i += 128) {
    for (var j = 72; j < CAM_HEIGHT; j += 144) {
        var starSize = 0.5;
        var x1 = camera_get_view_x(view_camera[0]) + i + starX * 1;
        while (x1 >= camera_get_view_x(view_camera[0]) + CAM_WIDTH)
            x1 -= CAM_WIDTH;
        var x2 = x1 + starSize;
        var y1 = camera_get_view_y(view_camera[0]) + j + starY * 0.8;
        while (y1 >= camera_get_view_y(view_camera[0]) + CAM_HEIGHT)
            y1 -= CAM_HEIGHT;
        var y2 = y1 + starSize;
        draw_rectangle_color(x1, y1, x2, y2, c_white, c_white, c_white, c_white, false);
    }
}

var xAmount = 1;
var yAmount = 1;
starX += xAmount;
starY += yAmount;

draw_set_alpha(getAlpha);