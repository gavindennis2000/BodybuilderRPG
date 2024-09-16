
// draw the lifters
if (drawLifters) {
	// the actual lifters
	var playerY = room_height/2 + 48;
	draw_sprite_ext(sprPullupPlayer, -1, playerX, playerY, 2, 2 ,image_angle, image_blend, 1);  // player	
	draw_sprite_ext(otherSpr, otherIndex, otherX, playerY, 2, 2 ,image_angle, c_red, 1);  // other
	//draw_text(playerX, playerY - 64, image_speed);
	fontX(fa_center);
	fontY(fa_middle);
	draw_set_font(fontScore);
	
	// player names
	drawScore(playerX, playerY + 74, global.characterName)
	drawScore(otherX, playerY + 74, "MASON");
	
	// player scores
	var playerPullupsStr = playerPullups < 10 ? string_concat("0", playerPullups) : string(playerPullups);
	var otherPullupsStr = otherPullups < 10 ? string_concat("0", otherPullups) : string(otherPullups);
	drawScore(playerX, playerY - 106, playerPullupsStr)
	drawScore(otherX, playerY - 106, otherPullupsStr)
	
	fontX(fa_right);
	fontY(fa_top);
	var dis = 2;
	var hs = "";
	if (highscore < 10) { hs = string_concat("HIGHSCORE: 0", string(highscore)); }
	else { hs = string_concat("HIGHSCORE: ", highscore); }
	drawScore(room_width - dis, 0 - dis, hs);
	
	// draw the timer	
	if (alarm_get(2) > 0 or countdown >= 2) {
		
		var w = 54; var h = 16;
		draw_sprite(sprTimer, 0, room_width/2, room_height/2 + 64 + timerY);
		fontX(fa_center);
		fontY(fa_middle);
	
		if (alarm_get(2) >= 0) {
			var time = string(alarm_get(2)/60)
			while (string_length(time) < 5) { 
				if (alarm_get(2) >= 10 * 60) { time = string_concat(time,"0"); }
				else { time = string_concat("0", time) }
			}
			drawScore(room_width/2, room_height/2 + 64 + timerY, time);
		}
		else {
			drawScore(room_width/2, room_height/2 + 64 + timerY, "00.00");
		}
		timerY *= 3/4;
	}
	
}

// draw the countdown number
if (countdown == 1) {
	fontX(fa_center);
	fontY(fa_middle);
	
	drawScoreExt(room_width/2, room_height/2, countdownNum, countdownScale, countdownScale);
	countdownScale += 0.03;
	if (countdownScale >= 3 or (countdownScale >= 2.5 and countdownNum == "BEGIN!") ) {
		countdownScale = 1;
		if (countdownNum == "BEGIN!") { countdown = 2; }
		else if (countdownNum == 1) { 
			countdownNum = "BEGIN!";
			instance_create_layer(x, y, layer, objPullupButton);
			alarm[1] = 1;  // other starts doing pullups
			// here's the timer
			alarm[2] = 3 * 60;  // start the countdown
		}
		else { countdownNum--; }
	}
}

// black rectangles when the room fades in
if (fadeBlack > 0) {
	for (var i = 0; i < room_width; i += 32)	{
		var b = c_black;
		draw_rectangle_color(i, 0, i+16, fadeBlack, b, b, b, b, false);	
		draw_rectangle_color(i+16, room_height, i+32, room_height-fadeBlack, b, b, b, b, false);
	}
}

if (levelUpAlpha > 0) {
	fontX(fa_left);
	fontY(fa_bottom);
	drawScoreAlpha(8 + 8, levelUpY-8 + 8, "LEVEL UP!", levelUpAlpha/4);
	drawScoreAlpha(8 + 4, levelUpY-8 + 4, "LEVEL UP!", levelUpAlpha/2);
	drawScoreAlpha(8, levelUpY-8, "LEVEL UP!", levelUpAlpha);

	levelUpY--;
	levelUpAlpha -= 0.01;
}

if (victoryTextScale > 0) {
	var tempAlpha = draw_get_alpha();
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(tempAlpha);
	fontX(fa_center);
	fontY(fa_middle);
	draw_set_font(fontScore);
	
	drawScoreExt(room_width/2, room_height/2 - 64, victor, victoryTextScale, victoryTextScale);
	
	if (victoryTextScale < 2) {
		victoryTextScale += 0.005;
	} else if (alarm_get(3) <= 0) { alarm[3] = 60; }
}

if (fadeAlpha > 0) {
	var alpha = draw_get_alpha();
	draw_set_alpha(fadeAlpha);
	var b = c_black;
	draw_rectangle_color(0, 0, room_width, room_height, b, b, b, b, false);
	draw_set_alpha(alpha);
}