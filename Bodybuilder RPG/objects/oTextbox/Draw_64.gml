// draw the textbox
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var margin = 16;
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

font_enable_effects(fTextbox, true, {
    dropShadowEnable: true,
    dropShadowOffsetX: 1,
    dropShadowOffsetY: 1,
    dropShadowSoftness: 3,
    dropShadowAlpha: 0.8,
    dropShadowColour: color,
});

// draw the text
drawTextOutline(margin, CAM_HEIGHT - margin, name == "" ? drawStr : $"{name}: {drawStr}", c_white, c_black, 1);

// draw a box when theres a prompt
if (showPrompt) {
    // font position and effects for prompt box
    draw_set_font(fPrompt);
    fontXY(fa_middle, fa_center);
    // font effects
    font_enable_effects(fPrompt, true, {
        dropShadowEnable: true,
        dropShadowOffsetX: 1,
        dropShadowOffsetY: 1,
        dropShadowSoftness: 1,
        dropShadowAlpha: 1,
        dropShadowColour: c_black,
    });
    // scale up the prompt box
    if (promptScale < 1)
        promptScale += 0.1;
    var promptX = CAM_WIDTH / 2;
    var promptY = CAM_HEIGHT / 2 + 24;
    var promptWidth = 200;
    var promptHeight = 38;
    var c1 = c_blue, c2 = c_white, c3 = c_blue, c4 = c_black;
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.6);
    draw_rectangle_color(promptX - promptWidth / 2 * promptScale, promptY - promptHeight / 2 * promptScale, promptX + promptWidth / 2 * promptScale, promptY + promptHeight / 2 * promptScale, c1, c2, c3, c4, false);
    draw_rectangle_color(promptX - promptWidth / 2 * promptScale, promptY - promptHeight / 2 * promptScale, promptX + promptWidth / 2 * promptScale, promptY + promptHeight / 2 * promptScale, c_white, c_white, c_white, c_white, true);
    draw_set_alpha(getAlpha);
    if (promptScale == 1) {
        var drawPromptText = function(promptX, promptY, txt, index, selection) {
            var cY = c_yellow;
            drawTextOutline(promptX, index == 0 ? promptY - 8 : promptY + 8, txt, selection == index ? cY: c_white, c_black, 1);
            return;
        }
        drawPromptText(promptX, promptY, prompt[0], 0, promptSelection);
        drawPromptText(promptX, promptY, prompt[2], 1, promptSelection);
    }
}