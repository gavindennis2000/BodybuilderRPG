// objController drawGUI

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// set the background on the space room 
if (room == rSpace) {
    var layID = layer_get_id("Background");
    if (layer_get_y(layID) != camera_get_view_y(view_camera[0]))
        layer_y(layID, camera_get_view_y(view_camera[0]));
}
// handle fade
if (global.chapter == 1 && global.events.endCh1 && room == rOverworld) {
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.7);
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(getAlpha);
}
    
if (fadeAmount > 0) {
    var alpha = draw_get_alpha();
    draw_set_alpha(fadeAmount);
    var color = (room == rSpace) ? c_white : c_black;
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, color, color, color, color, false);
    draw_set_alpha(alpha);
}

// cutscenes: show some cool black bars
// layer = layer_create(layer_get_depth(layer_get_id("Instances")) , "cutscene");
if (TEST && global.cutscene) {
    draw_set_font(fTextboxSmall);
    fontXY(fa_left, fa_middle);
    drawTextOutline(3, CAM_HEIGHT / 3 + 5, "cutscene in progress", c_white, c_black, 0.5);
}

// show the name of the room at the beginning of room start
if (showRoomVar && room != rBattle) {
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
    drawTextOutline(CAM_WIDTH - margin, 0 + margin, global.roomVar, c_white, c_black, showRoomVarAlpha);

    if (showRoomVarAlpha < 0) {
        showRoomVarAlpha = 0;
        showRoomVar = false;
    }
}

// show the name of the room at the beginning of room start
if (showSubRoomVar && room != rBattle) {
    // set the opacity of the text
    var getAlpha = draw_get_alpha();
    var alphaChange = 0.075;

    if (showSubRoomVarAlpha < 1 && showSubRoomAlarm > 0) {
        showSubRoomVarAlpha += alphaChange;
        showSubRoomAlarm--;
    }
    else if (showSubRoomAlarm <= 0)
        showSubRoomVarAlpha -= alphaChange;
    else {
        showSubRoomAlarm--;
    }
    // debug(showSubRoomAlarm);

    // draw the actual text finally
    draw_set_font(fTextbox);
    fontXY(fa_right, fa_bottom);
    var margin = 2;
    drawTextOutline(CAM_WIDTH - margin * 3, CAM_HEIGHT - margin, global.subRoomVar, c_white, c_black, showSubRoomVarAlpha);

    if (showSubRoomVarAlpha < 0) {
        showSubRoomVarAlpha = 0;
        showSubRoomVar = false;
    }
}
