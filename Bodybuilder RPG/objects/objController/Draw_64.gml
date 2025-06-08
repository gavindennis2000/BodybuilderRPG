// objController drawGUI

// handle fade
if (fadeAmount != 0) {
    var alpha = draw_get_alpha();
    draw_set_alpha(fadeAmount);
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(alpha);
}
