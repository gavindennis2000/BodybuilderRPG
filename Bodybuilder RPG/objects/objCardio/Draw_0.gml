// draw the minigame
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// draw black screen
var alpha = draw_get_alpha();
draw_set_alpha(0.97);
var rW = 480 - 16, rH = 270 - 16;
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var centerX = camX + 240, centerY = camY + 135;  // center of the screen

// increment scale
if (!endMinigame) {
    if (scale < 1) { scale += 0.05; }  // the black screen gets bigger
}
else {
    if (scale > 0) { scale -= 0.05; }
}

draw_rectangle_color(centerX - (rW/2)*scale, centerY - (rH/2)*scale, centerX + (rW/2)*scale, centerY + (rH/2)*scale, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(centerX - (rW/2)*scale, centerY - (rH/2)*scale, centerX + (rW/2)*scale, centerY + (rH/2)*scale, c_white, c_white, c_white, c_white, true);

// draw exit text
draw_set_font(fontText);
var drawColor = draw_get_color();
draw_set_color(c_white);
fontX(fa_center);
fontY(fa_bottom);

// don't go any further if window isn't done scaling
if (scale != 1) {

    // put the drawing color back
    draw_set_color(drawColor);
    // reset drawing alpha
    draw_set_alpha(alpha);

    exit;
}

// draw the 'how to quit' text
if (counter2 % 2 == 0 && textAlpha < 1)
    textAlpha += 0.02;
else
    textAlpha -= 0.01;
draw_text_border(centerX, camY + 260, "Press Start to Quit", c_white, textAlpha, c_dkgrey);

if (state == "start" && counter2 >= 1) {
    // draw the level

    if (startX <= camX - 100) {
        state = "game";
    }

    draw_set_font(fontScore);
    if (startX > centerX + 0.15) {
        startX -= (startX - centerX) / 10;
    }
    else {
        startX -= abs(startX - centerX - 1) / 5;
    }

    draw_text_color(startX, centerY, "BRAWN PATROL",c_white, c_white, c_white, c_white, 1);
}

if (state == "game") {
    //
}