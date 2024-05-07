var i = 6;
y -= i;
draw_self();
y += i;

var c = c_white;
var b = c_black;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntTextBox);
if (drawAction) {
	//draw_text_color(x+17, y - 15, "Read", b, b, b, b, daAlpha);
	//draw_text_color(x+16, y - 16, "Read", c, c, c, c, daAlpha);
	draw_sprite_ext(sprOrbRead, 0, x+16, y-15, 1, 1, image_angle, image_blend, daAlpha);
}