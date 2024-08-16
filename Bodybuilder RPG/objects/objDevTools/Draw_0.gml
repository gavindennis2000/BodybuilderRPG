var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);


var str = string_concat("min: ", global.minimum, " max: ", global.maximum, " total: ", global.total)

fontX(fa_left); fontY(fa_bottom);
draw_set_font(fontText);

draw_text_border(camX, camY + 270, str, c_white, 0.8)