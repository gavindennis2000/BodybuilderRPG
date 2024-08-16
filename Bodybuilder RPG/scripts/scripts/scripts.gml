function draw_text_border(x, y, string, color, alpha, border = c_black) {
	var c = border;
	draw_text_color(x+1, y+1, string, c, c, c, c, alpha);
	draw_text_color(x, y, string, color, color, color, color, alpha);	
}

function fontX(halign) {
	draw_set_halign(halign);
}
function fontY(valign) {
	draw_set_valign(valign);
}