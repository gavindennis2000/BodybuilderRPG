// objTextbox DrawGUI

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

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
draw_set_alpha(0.95);
draw_rectangle_color(  // main
    0 + (CAM_WIDTH / 2 * fade) + margin, 
    CAM_HEIGHT - 96 + (96 / 2 * fade) + margin, 
    CAM_WIDTH - (CAM_WIDTH / 2 * fade) - margin, 
    CAM_HEIGHT - (96 / 2 * fade) - margin, 
	 color1, color1, color2, color2, false
);
draw_set_alpha(alpha);

// draw the talker's name, picture, and speech
draw_set_font(fTextbox);
var picX = 16;
var picY = CAM_HEIGHT - 96 + picX;
var picLength = 68;
var textX = picX + picLength + 10;
var textY = picY - 5;
if (fade != 0)
    exit;

// the picture
var pictureIndex = 1;
if (pictureIndex != -1 && name != "third")
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