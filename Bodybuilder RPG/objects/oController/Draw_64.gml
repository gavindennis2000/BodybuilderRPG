// game controller draw gui 
// fades in/out the room and has debug info
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (fadeAmount > 0) {
    var getAlpha = draw_get_alpha();
    draw_set_alpha(fadeAmount);
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, fadeColor, fadeColor, fadeColor, fadeColor, false);
    draw_set_alpha(getAlpha);
}