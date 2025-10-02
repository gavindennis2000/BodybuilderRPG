// draw the textbox
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var margin = 16;
var c1 = TEXTBOX1, c2 = TEXTBOX2, c3 = c1, c4 = TEXTBOX4, cOutline = c_white;

fontXY(fa_left, fa_center);
draw_set_font(fTextbox);

var color = c_black;
switch (name) {
    case "Andro":
        color = c_blue;
        break;
    default:
        color = c_black;
        break;
}

// draw the textbox
var textboxMargin = 8;
var textboxX = CAM_WIDTH / 2;
var textboxY = CAM_HEIGHT - 40;
var textboxW = (CAM_WIDTH - textboxMargin) * textboxScale;
var textboxH = (68 - textboxMargin) * textboxScale;
var getAlpha = draw_get_alpha();

if (sign(textboxScaleChange) == 1 && textboxScale < 1) {
    textboxScale += textboxScaleChange;
}
else if (sign(textboxScaleChange) == -1 && textboxScale > 0) {
    textboxScale += textboxScaleChange;
    debug(textboxScale);
    if (textboxScale <= 0)
        instance_destroy();
}

draw_set_alpha(0.8);
draw_rectangle_color(textboxX - textboxW / 2, textboxY - textboxH / 2, textboxX + textboxW / 2, textboxY + textboxH / 2, c1, c2, c3, c4, false);
draw_rectangle_color(textboxX - textboxW / 2, textboxY - textboxH / 2, textboxX + textboxW / 2, textboxY + textboxH / 2, c_white, c_white, c_white, c_white, true);
draw_set_alpha(getAlpha);

// draw the text
if (textboxScale == 1) {
    fontXY(fa_left, fa_top);
    drawTextOutline(margin, CAM_HEIGHT - 61, drawStr, c_white, c_black, 1);
}

// draw the name if there is one
if (name != -1 && textboxScale == 1) {
    fontXY(fa_left, fa_center);
    draw_set_font(fPrompt);
    drawTextOutline(textboxX - textboxW / 2 + 6, textboxY - 30, name, c_white, c_black, 1);
}

// draw the next icon if the draw string length matches the text object
if (variable_struct_exists(textObj, "text") && string_length(drawStr) == string_length(textObj.text))
    draw_sprite(sprNext, 0, CAM_WIDTH / 2, CAM_HEIGHT - 11);

// draw a box when theres a prompt
if (showPrompt) {
    // font position and effects for prompt box
    draw_set_font(fPrompt);
    fontXY(fa_middle, fa_center);
    // scale up the prompt box
    if (promptScale < 1)
        promptScale += 0.05;
    var promptX = CAM_WIDTH / 2;
    var promptY = CAM_HEIGHT / 2 + 61;
    var promptWidth = 250;
    var promptHeight = 42;
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.8);
    draw_rectangle_color(promptX - promptWidth / 2 * promptScale, promptY - promptHeight / 2 * promptScale, promptX + promptWidth / 2 * promptScale, promptY + promptHeight / 2 * promptScale, c1, c2, c3, c4, false);
    draw_rectangle_color(promptX - promptWidth / 2 * promptScale, promptY - promptHeight / 2 * promptScale, promptX + promptWidth / 2 * promptScale, promptY + promptHeight / 2 * promptScale, cOutline, cOutline, cOutline, cOutline, true);
    draw_set_alpha(getAlpha);
    if (promptScale == 1) {
        var drawPromptText = function(promptX, promptY, txt, index, selection) {
            var cY = c_yellow;
            var yDist = 10;
            drawTextOutline(promptX, index == 0 ? promptY - yDist : promptY + yDist, txt, selection == index ? cY: c_white, 1);
            return;
        }
        drawPromptText(promptX, promptY, prompt[0], 0, promptSelection);
        drawPromptText(promptX, promptY, prompt[2], 1, promptSelection);
    }
}