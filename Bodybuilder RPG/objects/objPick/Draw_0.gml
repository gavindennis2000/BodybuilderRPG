// draw the "guitar picks" and rectangle bars to make it easier to see
// the notes

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var c1 = c_white;
var c2 = c_black;
var tempAlpha = draw_get_alpha();
draw_set_alpha(0.5);
draw_rectangle_color(x - 16, camY + barY, x + sprite_width/2, camY + 270 + barY, c1, c1, c2, c2, false);
draw_set_alpha(tempAlpha);

// increment barY
if (barY > 0) { barY /= 1.05; }

// draw the picks
draw_self();
