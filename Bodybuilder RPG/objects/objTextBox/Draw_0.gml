// draw the text box
var camX = camera_get_view_x(view_camera[0]);
var camY = (screen == "top") ? camera_get_view_y(view_camera[0]) : camera_get_view_y(view_camera[0]) + 270-64;
draw_set_alpha(drawAlpha - 0.15);
draw_sprite(sprTextBox, 0, camX, camY);

if (TEST) {

	//draw_text(camX, camY + 84, "string length" + string(stringLength) );
	//draw_text(camX, camY+ 104, "drawText: " + string(string_length(drawText)) );
	//draw_text(camX, camY+ 124, "Index:" + string(indexCheck) );
	//draw_text(camX, camY+ 144, "next: " + string(next) );

}

var textX = camX + 25;
var textY = camY + 10;

// draw the text
draw_set_font(fntTextBox);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(drawAlpha);

draw_text(textX, textY, drawText);