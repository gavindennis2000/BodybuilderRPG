/*gmlive*/ if (TEST) { if (live_call()) return live_result; }
draw_set_font(fDeveloper);
var textAlpha = (instance_exists(oTextbox)) ? 0.1 : 0.7;
if (!global.showDetails) {
    fontXY(fa_left, fa_bottom);
    drawTextOutline(0, CAM_HEIGHT, "developer mode", c_white, c_black, textAlpha);

    fontXY(fa_right, fa_bottom);
    drawTextOutline(CAM_WIDTH, CAM_HEIGHT, "q: show details", c_white, c_black, textAlpha);
}
else {
    fontXY(fa_left, fa_bottom);
    // draw the dev tools here

    fontXY(fa_right, fa_bottom);
    drawTextOutline(CAM_WIDTH, CAM_HEIGHT, "q: hide details", c_white, c_black, textAlpha);
}