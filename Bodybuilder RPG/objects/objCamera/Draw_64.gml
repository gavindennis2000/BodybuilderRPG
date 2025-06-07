// objCamera DrawGUI
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var diffX = objPlayer.x - x;
var diffY = objPlayer.y - y;

draw_text(0, 0, $"\n\n diffX: {diffX} diffY: {diffY} \n x: {x} y {y}  \n xTo: {xTo} yTo: {yTo}");
