/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// get the weight on the bar
var weightSpr = -1, weightNum = 0;
switch (global.workout) {
	case "novice leg":
		weightSpr = sprSquatWeight;
		if (global.stats.legs + levelsToAdd >= 30) { weightNum = 2; }
		else if (global.stats.legs + levelsToAdd >= 20) { weightNum = 1; }
		break;
}

// get the player's hair color
var hairColor = getHairColor();

// set the player's y position
var playerY = 140;

// draw the level up text
if (levelUpAlpha > 0) {
	fontX(fa_left);
	fontY(fa_bottom);
	draw_set_font(fontScore);
	drawScoreAlpha(camX + 8 + 8, levelUpY-8 + 8, "LEVEL UP!", levelUpAlpha/4);
	drawScoreAlpha(camX + 8 + 4, levelUpY-8 + 4, "LEVEL UP!", levelUpAlpha/2);
	drawScoreAlpha(camX + 8, levelUpY-8, "LEVEL UP!", levelUpAlpha);
	
	// white fog effect on player
	var oldFog = gpu_get_fog();
	gpu_set_fog(true, c_white, 0, 0);   
	draw_sprite_part_ext(sprSquat, imgIndex, 0 + 64*global.outfit.color, 0, 64, 32, camX + playerX, camY + playerY, 2, 2, image_blend, 1);
	draw_sprite_part_ext(sprSquatHair, imgIndex, 0 + 64*global.outfit.hair, 0, 64, 32, camX + playerX, camY + playerY - 8, 2, 2, hairColor, 1);
	draw_sprite_part_ext(weightSpr, imgIndex, 0 + 64 * weightNum, 0, 64, 32, camX + playerX, camY + playerY, 2, 2, image_blend, image_alpha);
	gpu_set_fog(oldFog[0], oldFog[1], oldFog[2], oldFog[3]);

	levelUpY--;
	levelUpAlpha -= 0.01;
}

// draw current reps and PR's
fontX(fa_center);
fontY(fa_middle);
draw_set_font(fontScore);
switch (global.workout) {
	case "novice leg":
		var str = $"PR: {global.PRs[2].weight}{global.PRs[2].reps}"
		drawScore(camX + playerX + 48, camY + 24, str);
		var weight = "225";
		if (global.stats.legs + levelsToAdd >= 30) { weight = "405"; }
		else if (global.stats.legs + levelsToAdd >= 20) { weight = "315"; }
		var str2 = $"Weight: {weight}\nReps: {reps}"
		drawScore(camX + playerX + 48, camY + 90, str2);
		break;
}

// draw the player
if (image_alpha < 1) { image_alpha += 0.1; }
switch(global.workout) {
	case "novice leg":
		// draw the player fading
		if (blackOut) {
			// the actual player with the empty barbell
			draw_sprite_part_ext(sprSquat, imgIndex, 0 + 64*global.outfit.color, 0, 64, 32 - deadY, camX + playerX, camY + playerY, 2, 2, c_black, image_alpha);
			// the player's hair
			draw_sprite_part_ext(sprSquatHair, imgIndex, 0 + 64*global.outfit.hair, 0, 64, 32 - deadY, camX + playerX, camY + playerY - 8, 2, 2, c_black, image_alpha);
			// the weights on the barbell
			draw_sprite_part_ext(weightSpr, imgIndex, 0 + 64*weightNum, 0, 64, 32 - deadY, camX + playerX, camY + playerY, 2, 2, c_black, image_alpha);
			if (deadY < 40) {
				deadY++;
			}
		}
		else {
			// the actual player with the empty barbell
			draw_sprite_part_ext(sprSquat, imgIndex, 0 + 64*global.outfit.color, 0, 64, 32, camX + playerX, camY + playerY, 2, 2, image_blend, image_alpha);
			// the player's hair
			draw_sprite_part_ext(sprSquatHair, imgIndex, 0 + 64*global.outfit.hair, 0, 64, 32, camX + playerX, camY + playerY - 8, 2, 2, hairColor, image_alpha);
			// the weights on the barbell
			draw_sprite_part_ext(weightSpr, imgIndex, 0 + 64*weightNum, 0, 64, 32, camX + playerX, camY + playerY, 2, 2, image_blend, image_alpha);
		}
		break;
	case "intermediate push":
		break;
	case "advanced pull":
		break;
}

// draw the fatigue bar
/*
Fatigue states
good    	00-50%   	#ffffff
caution 	50-75%  	#ff6666
danger  	75-99%  	#ff3333
*/
var pX = playerX + 158, pY = camY + 230, pColor = #ff6666;

// get color for fatigue state
var fatigue = global.stats.fatigue, pColor = c_white, barDistance = 20;
if (fatigue < 25) { pColor = c_white; }
else if (fatigue < 50) { pColor = #ffcccc; }
else if (fatigue < 75) { pColor = #ff9999; }
else { pColor = #ff6666; }
	
// give the bar some animation when it goes up and down
var inc = 3;
if (drawFatigue != fatigue) {
	if (fatigue > drawFatigue) { 
		if (fatigue >= drawFatigue + inc)
			drawFatigue += inc; 
		else 
			drawFatigue = fatigue;
	}
	if (fatigue < drawFatigue) { 
		if (fatigue <= drawFatigue - inc)
			drawFatigue -= inc; 
		else 
			drawFatigue = fatigue;
	}
}
if (drawFatigue < 0) { drawFatigue = 0; }
if (drawFatigue > 100) { drawFatigue = 100; }
if (fatigue > 100) fatigue = 100;

// draw the fatigue meter   
fatigueStr = string(fatigue);
if (string_length(fatigueStr) < 2) { fatigueStr = string_concat("0",fatigue); }
draw_set_font(fontMenu);
fontX(fa_center);
fontY(fa_middle);
draw_text_border(pX, pY, string_concat("Fatigue: ", fatigueStr, "%"), pColor, 1);  // name
var barH = 10, barW = 100, barX = pX + 93, barY = pY + 38;
draw_rectangle_color(pX - barW/2, barY - barH/2 - barDistance, pX + barW/2, barY + barH/2 - barDistance, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
draw_rectangle_color(pX - barW/2, barY - barH/2 - barDistance, pX - barW/2 + drawFatigue, barY + barH/2 - barDistance, c_red, pColor, pColor, c_red, false);  // actual fatigue bar
draw_rectangle_color(pX - barW/2, barY - barH/2 - barDistance, pX + barW/2, barY + barH/2 - barDistance, c_white, c_white, c_white, c_white, true);  // fatigue bar outline

// the pause screen
if (isPaused) {
	// draw the screen black when pausing
	var tempAlpha = draw_get_alpha();
	draw_set_alpha(.75);
	draw_rectangle_color(camX, camY, camX + 480, camY + 270, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(tempAlpha);
	// pause menu text
	if (!isExiting) {
		fontX(fa_center);
		fontY(fa_middle);
		draw_set_font(fontMenu);
		var dist = 25;
		draw_text_border(camX + 480/2, camY + 270/2 - dist, "Exit Minigame?\n(all progress will be lost)", c_white);
		draw_text_border(camX + 480/2 - dist, camY + 270/2 + dist, "No", selection == "no" ? c_yellow : c_white);
		draw_text_border(camX + 480/2 + dist, camY + 270/2 + dist, "Yes", selection == "yes" ? c_yellow : c_white);
	}
}