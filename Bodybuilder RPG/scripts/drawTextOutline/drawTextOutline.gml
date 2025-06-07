function drawTextOutline(xPos, yPos, str, color = c_white, outline = c_black, alpha = 1) {
	draw_text_color(xPos + 1, yPos + 1, str, outline, outline, outline, outline, alpha);
	draw_text_color(xPos + 2, yPos + 1, str, outline, outline, outline, outline, alpha);
	draw_text_color(xPos, yPos, str, color, color, color, color, alpha);
}