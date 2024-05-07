// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_border(x, y, str, color, alpha){
	
	draw_text_color(x+1, y+1, str, c_black, c_black, c_black, c_black, alpha);
	draw_text_color(x, y, str, color, color, color, color, alpha);
	
}