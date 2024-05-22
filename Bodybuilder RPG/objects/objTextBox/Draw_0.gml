// draw the text box
var camX = camera_get_view_x(view_camera[0]);
var camY = (screen == "top") ? camera_get_view_y(view_camera[0]) : camera_get_view_y(view_camera[0]) + 270-74;
draw_sprite_ext(sprTextBox, 0, camX, camY, 1, 1, image_angle, personColor, 0.85);

if (TEST) {

	//draw_text(camX+60, camY + 84, camera_get_view_y(view_camera[0])+135 );
	//draw_text(camX+60, camY+ 104, objPlayer.y+16);
	//draw_text(camX, camY+ 124, "Index:" + string(indexCheck) );
	//draw_text(camX, camY+ 144, "next: " + string(next) );

}

var textX = camX + 35;
var textY = camY + 10;

// draw the text
draw_set_font(fntTextBox);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
image_alpha = drawAlpha;

if (next) {
	draw_sprite_ext(sprNextGlow, 0, camX+240, camY + 64, 1, 1, image_angle, image_blend, glowAlpha);
	draw_sprite_ext(sprNext, 0, camX+240, camY + 64, 1, 1, image_angle, image_blend, nextAlpha);
}

draw_text_border(textX, textY, drawText, c_white, 1);