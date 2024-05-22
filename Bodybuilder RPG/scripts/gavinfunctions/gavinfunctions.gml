// easier to use functionss
function draw_text_border(x, y, str, color, alpha){
	
	draw_text_color(x+1, y+1, str, c_black, c_black, c_black, c_black, alpha);
	draw_text_color(x+1, y+2, str, c_black, c_black, c_black, c_black, alpha);
	draw_text_color(x, y, str, color, color, color, color, alpha);
	
	
}

function fontX(hAlign) {
	draw_set_halign(hAlign);	
};

function fontY(vAlign) {
	draw_set_valign(vAlign);	
};

function camGetX() {
	return camera_get_view_x(view_camera[0]);	
}

function camGetY() {
	return camera_get_view_y(view_camera[0]);	
}