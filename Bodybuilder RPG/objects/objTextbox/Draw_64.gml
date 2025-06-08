// objTextbox DrawGUI

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (text == -1)
    exit;

screen = (objPlayer.y >= camera_get_view_y(view_camera[0]) + CAM_WIDTH / 2 - 96) ? "top" : "bottom";
if (screen == "top" && textY != textYTop) {
    var increment = 8;
    if (textY < CAM_HEIGHT) {
        textY += increment;
        textboxY += increment;
        picY += increment;
    }
    else if (textY >= CAM_HEIGHT) {
        textY = textYTop - 96;
        textboxY = textboxYTop - 96;
        picY = picYTop - 96;
    }
    else {
        textY += increment;
        textboxY += increment;
        picY += increment;
    }
}
else if (screen == "bottom" && textY != textYBottom) {
    var increment = 8;
    if (textY > - 96) {
        textY -= increment;
        textboxY -= increment;
        picY -= increment;
    }
    else if (textY <= -96) {
        textY = textYBottom + 96;
        textboxY = textboxYBottom + 96;
        picY = picYBottom + 96;
    }
    else {
        textY += increment;
        textboxY += increment;
        picY += increment;
    }
}

// fade in/out the textbox
var fadeAmount = 0.075;
if (fade > 0 && !destroy)
    fade -= fadeAmount;
if (fade < 0 && !destroy)
    fade = 0;
if (destroy) {
    if (fade < 0.9) 
        fade += fadeAmount;
    else
        // destroy the textbox instance after it fades out
        instance_destroy();
}

// get the textbox color
var color1, color2 = c_black;
var name = currentTextObj.name;
switch (name) {
    case "andro":
    case "ana":
    case "doms":
        color1 = #00364d; 
        break;
    case "jim":
        color1 = #264d00;
        break;
    case "enemy":
        color1 = #4d0000
        break;
    case "samson":
        color1 = #32004d
        break;
    default:
        color1 = #1a1a1a;
        break;
}

// draw the textbox stuff
var alpha = draw_get_alpha();
var margin = 4;
draw_set_alpha(0.9);
draw_rectangle_color(  // main
    0 + (CAM_WIDTH / 2 * fade) + margin, 
    textboxY + (96 / 2 * fade) + margin, 
    CAM_WIDTH - (CAM_WIDTH / 2 * fade) - margin, 
    textboxY + 96 - (96 / 2 * fade) - margin, 
	 color1, color1, color2, color2, false
);
draw_set_alpha(alpha);

// draw the talker's name, picture, and speech
draw_set_font(fTextbox);
var picX = 16;
var picLength = 68;
var textX = picX + picLength + 10;
if (fade != 0)
    exit;

// the picture
var pictureIndex = 1;
if (pictureIndex != -1)
    draw_rectangle_color(picX, picY, picX + picLength, picY + picLength, c_white, c_white, c_white, c_white, false);
else {
    textX -= picLength;
}
if (name != -1) {
    // the name
    fontXY(fa_center, fa_bottom);
    drawTextOutline(picX + picLength / 2, picY + 1, string_upper(name));
}
if (drawText != "") {
    // the text 
    fontXY(fa_left, fa_top);
    drawTextOutline(textX, textY, drawText);
}