draw_self();

var c = c_white;
var b = c_black;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntTextBox);
if (drawAction) {
	draw_text_color(x+17, y - 15, "Read", b, b, b, b, daAlpha);
	draw_text_color(x+16, y - 16, "Read", c, c, c, c, daAlpha);
}