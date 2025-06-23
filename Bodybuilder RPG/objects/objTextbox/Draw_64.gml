// objTextbox DrawGUI

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (text == -1)
    exit;

screen = (instance_exists(objPlayer) && objPlayer.y < camera_get_view_y(view_camera[0]) + CAM_WIDTH / 2 - 96) ? "bottom" : "top";
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
var name = variable_struct_exists(currentTextObj, "name") ? currentTextObj.name : "monologue";
var alias = variable_struct_exists(currentTextObj, "alias") ? currentTextObj.alias: -1;
var emotion = variable_struct_exists(currentTextObj, "emotion") ? currentTextObj.emotion : "neutral";
var tone = variable_struct_exists(currentTextObj, "tone") ? currentTextObj.tone : -1;
switch (name) {
    case "andro":
    case "ana":
    case "doms":
    case "monologue":
        color1 = #00364d; 
        break;
    case "jim":
        color1 = #264d00;
        break;
    case "enemy":
        color1 = #4d0000;
        break;
    case "samson":
        color1 = #32004d;
        break;
    case "mom":
        color1 = #85044d;
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
var picX = 16;
var picLength = 68;
var textX = picX + picLength + 10;
if (fade != 0)
    exit;

// the picture
var pictureIndex = getPictureIndex(name);
switch (emotion) {
    // get the emotion of the talker for the portrait
    case "happy":
        pictureIndex += 1;
        break;
    case "frustrated":
        pictureIndex += 2;
        break;
    case "cocky":
        pictureIndex += 3;
        break;
    case "angry":
        pictureIndex += 4;
        break;
    case "neutral":
    default:
        break;
}
if (pictureIndex != -1) {
    var getAlpha = draw_get_alpha();
    var rectColor = c_white;
    draw_set_alpha(0.1);
    draw_rectangle_color(picX, picY, picX + picLength, picY + picLength, rectColor, rectColor, rectColor, rectColor, false);
    draw_set_alpha(getAlpha);
    draw_sprite_ext(sprPortraits, pictureIndex, picX, picY, 2, 2, 0, c_white, image_alpha);
}
else {
    textX -= picLength;
}
if (name != "monologue") {
    // the name
    fontXY(fa_center, fa_bottom);
    draw_set_font(fTextbox)
    drawTextOutline(picX + picLength / 2, picY + 1, string_upper(alias != -1 ? alias : name));
}
if (drawText != "") {
    // get the font size
    switch (tone) {
        // set the tone of the talker
        case "quiet":
            draw_set_font(fTextboxSmall);
            break;
        case "loud":
            draw_set_font(fTextboxLarge);
            break;
        default:    
            draw_set_font(fTextbox);
            break;
    }
    // the text 
    fontXY(fa_left, fa_top);
    drawTextOutline(textX, textY, drawText);

    if (readyForNext) {
        // if there's a prompt, display it
        if (is_array(prompt)) {
            fontXY(fa_center, fa_bottom);
            draw_set_font(fTextbox);
            var selectedColor = c_yellow;
            var strLength = string_length(prompt[0]);
            var prompt1X = CAM_WIDTH / 2 + picLength - CAM_WIDTH / 4;
            var prompt2X = CAM_WIDTH / 2 + picLength / 2 + CAM_WIDTH / 4;
            drawTextOutline(prompt1X, textY + picLength + 8, $"\n{prompt[0]}", selection == 0 ? selectedColor : c_white);
            drawTextOutline(prompt2X, textY + picLength + 8, $"\n{prompt[2]}", selection == 1 ? selectedColor : c_white);
        }
    }
}