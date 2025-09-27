// objPlayer DrawGUI

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!TEST)
    exit;

var testString = $"What do you mean?";

fontXY(fa_left, fa_top);
draw_set_font(fTextbox);
// draw_text(CAM_WIDTH / 2, CAM_HEIGHT / 2, $"{testString}")