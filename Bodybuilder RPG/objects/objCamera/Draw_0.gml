if (initBattle or whiteOut) {
	var w = c_white;
	draw_set_alpha(whiteAlpha);
	draw_rectangle_color(camX - camWidth, camY - camHeight, camX + camWidth*2, camY + camHeight*2, w, w, w, w, false);	
	//draw_text_border(objPlayer.x, objPlayer.y, whiteAlpha, c_blue, 1);
	//image_alpha = 1;
}