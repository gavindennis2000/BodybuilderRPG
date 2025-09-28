/*gmlive*/ if (TEST) { if (live_call()) return live_result; }
if (!global.showDetails) {
    draw_set_font(fPrompt);
    fontXY(fa_left, fa_bottom);
    drawTextOutline(0, CAM_HEIGHT, "developer mode", c_white, c_black, 0.8);

    fontXY(fa_right, fa_bottom);
    drawTextOutline(CAM_WIDTH, CAM_HEIGHT, "q: show details", c_white, c_black, 0.8);
}
else {
    draw_set_font(fPrompt);
    fontXY(fa_left, fa_bottom);

    fontXY(fa_right, fa_bottom);
    drawTextOutline(CAM_WIDTH, CAM_HEIGHT, "q: hide details", c_white, c_black, 0.8);
}