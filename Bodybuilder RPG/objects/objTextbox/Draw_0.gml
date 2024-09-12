// draw the text box
var camX = camera_get_view_x(view_camera[0]);
var camY = (screen == "top") ? camera_get_view_y(view_camera[0]) : camera_get_view_y(view_camera[0]) + 270-74;
draw_sprite_ext(sprTextbox, 0, camX, camY, 1, 1, image_angle, personColor, 0.85);

var textX = camX + 30;
var textY = camY + 8;

// draw the next arrow/prompt
if (next) {
	if (numberOfTexts <= 1 and prompt != false) {
		// draw the text
		draw_set_font(fontText);
		draw_set_color(c_white);
		image_alpha = drawAlpha;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		
		var colorSelection1 = selection == 0 ? #D8D800 : c_white;
		var colorSelection2 = selection == 1 ? #D8D800 : c_white;
		draw_text_border(camX + 120, textY + 48, prompt[0], colorSelection1, 1); // prompt 1
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		
		draw_text_border(camX + 360, textY + 48, prompt[1], colorSelection2, 1); // promt 2
	} 
	else {
		draw_sprite_ext(sprNextGlow, 0, camX+240, camY + 63, 1, 1, image_angle, image_blend, glowAlpha);
		draw_sprite_ext(sprNext, 0, camX+240, camY + 63, 1, 1, image_angle, image_blend, nextAlpha);
	}
}

// draw the text
draw_set_font(fontText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
image_alpha = drawAlpha;

draw_text_border(textX, textY, drawText, c_white, 1);

// draw the name
if (npcID != -1) {
	draw_set_font(fontName);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	image_alpha = drawAlpha;
	
	var name = string(npcID);
	if (string_pos("gym rat", name) == 1) {
		name = "gym rat";	
	}
	
	draw_text_border(camX + 4, camY - 2, string_upper(name), c_white, 1);
}