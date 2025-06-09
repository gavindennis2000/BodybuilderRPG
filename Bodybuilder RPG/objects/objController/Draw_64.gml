// objController drawGUI

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// handle fade
if (fadeAmount != 0) {
    var alpha = draw_get_alpha();
    draw_set_alpha(fadeAmount);
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(alpha);
}

// show the name of the room at the beginning of room start
if (showRoomVar) {
    // set the opacity of the text
    var getAlpha = draw_get_alpha();
    var alphaChange = 0.075;

    if (showRoomVarAlpha < 1 && alarm_get(2) > 0)
        showRoomVarAlpha += alphaChange;
    else if (alarm_get(2) <= 0)
        showRoomVarAlpha -= alphaChange;

    // draw the actual text finally
    draw_set_font(fTextbox);
    fontXY(fa_right, fa_top);
    var margin = 2;
    drawTextOutline(CAM_WIDTH - margin * 3, 0 + margin, global.roomVar, c_white, c_black, showRoomVarAlpha);

    if (showRoomVarAlpha < 0) {
        showRoomVarAlpha = 0;
        showRoomVar = false;
    }
}