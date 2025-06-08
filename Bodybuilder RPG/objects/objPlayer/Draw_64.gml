// objPlayer DrawGUI

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!TEST) {
    exit;
}

var testString = $"x {x} y {y}";

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0, 0, $"{testString}")