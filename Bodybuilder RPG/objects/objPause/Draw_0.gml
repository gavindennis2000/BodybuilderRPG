var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var dX = camX + 480-448;  // dashboard
var dY = camY + 270-238;

var pX = camX + 96+36;  // player portraits
var pY = camY + 270-238 + 20;

var oX = camX + 0;  // options
var oY = camY + 0;

if (pause and xChange > 0) { xChange -= 24; }
if (pause and yChange > 0) { yChange -= 15; }

else if (unpause and yChange < 270) { yChange += 15; }

if (pause) {
	
		var c = c_black;
		var w = c_white;
		draw_rectangle_color(camX, camY, camX + 480, camY + 270,c, c, c, c, false);
		
		// draw the chapter and location
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		if (!unpause) { draw_text_color(camX + 112+8, camY-yChange + 8, chapter, w, w, w, w, 1); }
		draw_set_halign(fa_right);
		if (!unpause) { draw_text_color(camX + 480-8, camY-yChange + 8, location, w, w, w, w, 1); }
		
		if (image_alpha == 1) {
			// draw the dashboard
		
			
			draw_sprite(sprPauseDash, 0, dX-xChange, dY);
			draw_sprite(sprPauseOptions, 0, oX, oY-yChange);
			
			var margin = 96+20;
			draw_sprite(sprPausePlayerQuade, 0, pX, pY+yChange);
			draw_sprite(sprPausePlayerBen, 0, pX + margin, pY+yChange);
			draw_sprite(sprPausePlayerDeadlyn, 0, pX + margin*2, pY+yChange);
			
			// draw the menu options
			var offX = 15; var offY = 25;
			draw_set_halign(fa_left);
			draw_text_border(oX+offX, oY-yChange+offX, "Items", w, 1);
			draw_text_border(oX+offX, oY-yChange+offX+offY, "Skills", w, 1);
			draw_text_border(oX+offX, oY-yChange+offX+offY*2, "Equipment", w, 1);
			draw_text_border(oX+offX, oY-yChange+offX+offY*3, "Stats", w, 1);
			draw_set_valign(fa_bottom);
			draw_text_border(oX+offX, oY-yChange-offX+238, "Quit", w, 1);
			draw_set_valign(fa_top);
		
		}
}