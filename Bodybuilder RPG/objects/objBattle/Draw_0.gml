//if (TEST) { draw_text(room_width/2, room_height/2 ,displayOptions[cursor]) }

if (gameOver) {
	
}
else if (victory) {

}
else {

	if showText {
		draw_set_font(fntTextBox);
		var height = 64;
		draw_sprite_ext(sprTextBox, 0, 0, 0, 1, 1, image_angle, image_blend, 0.85);
		fontX(fa_center);
		fontY(fa_middle);
		draw_text_border(room_width/2, height/2-8, text, c_white, 1);
	}
	else if showDesc {
		draw_set_font(fntTextBox);
		var height = 64;
		draw_sprite_ext(sprTextBox, 0, 0, 0, 1, 1, image_angle, image_blend, 0.85);
		fontX(fa_center);
		fontY(fa_middle);
		draw_text_border(room_width/2, height/2-8, text, c_white, 1);
	}

	// draw dashboard
	if (battleStart and !showText) {
		draw_set_font(fntHealth);
		var dashX = 4; var dashW = 200; var dashH = 56; var dashY = 270-dashH-4; 
		var textX = -y; var textY = -1; var xDis = -1; var yDis = -1;
		draw_sprite_ext(sprBattleDash, 0, dashX, dashY, 1, 1, image_angle, image_blend, 0.85);
		////draw_rectangle_color(dashX, dashY, dashX + dashW, dashY + dashH, c_blue, c_blue, c_black, c_black, false);

		// draw the fighting dashboard
		xDis = 12; yDis = dashH/3;
		var leftX = dashX + xDis; var rightX = leftX + dashW/2;
		var topY = dashY + yDis; var bottomY = dashY + yDis*2;
	
		fontX(fa_left); fontY(fa_middle);
		
		draw_text_border(leftX, topY, displayOptions[0], c_white, 1);
		draw_text_border(rightX, topY, displayOptions[1], c_white, 1);
		draw_text_border(leftX, bottomY, displayOptions[2], c_white, 1);
		if (dashboard == "Menu" and cantRun)
			draw_text_border(rightX, bottomY, displayOptions[3], c_gray, 1);
		else
			draw_text_border(rightX, bottomY, displayOptions[3], c_white, 1);
	
		// draw the cursor
		switch (cursor) {
			case 0:  // top left
				cursorX = leftX;
				cursorY = topY;
				break;
			case 1:  // top right
				cursorX = rightX;
				cursorY = topY;
				break;
			case 2:  // bottom left
				cursorX = leftX;
				cursorY = bottomY;
				break;
			case 3:  // bottom right
				cursorX = rightX;
				cursorY = bottomY;
				break;
		}
		draw_sprite(sprCursor, 0, cursorX, cursorY);
	
		// draw the skills descriptions
		showDesc = false;
		if (dashboard == "Skill") {
			drawSkillDescription(turn.skills[cursor+scroll][0]);
		} else if (dashboard == "Gymbag") {
			/* draw the skills descriptions */
			drawGymbagDescription(global.gymbag[cursor+scroll][0]);
		}
	
		// draw whose turn it is
		//draw_text(room_width/2, room_height/2, "maxscroll " + string(maxScroll));
		//draw_text(room_width/2, room_height/2 + 32, "scroll " + string(scroll));
	}
	// draw the queue
	if (battleStart) {
		for (i = 0; i < array_length(queue); i ++) {
			fontX(fa_right);
			fontY(fa_middle);
			var t = string_concat(queue[i].fighter);
			draw_text_border(room_width, room_height/2 - 64 + i*32, t, c_white, 1);
		}
	}
	// draw cursor on targets
	if (target != -1 and !wait) {
		image_speed = 0.1;
		var tX = target.x - 16;
		var tY = target.y;
		var cursorSpr = -1;
		switch (targetType) {
			case "Ally":
			case "Self":
				cursorSpr = sprCursorParty;
				tX = target.x + 16;
				tY = target.y;
				break;
			case "Party":
				cursorSpr = sprCursorParty;
				tX = array_create(array_length(fighterIDs), 0)
				for (i = 0; i < array_length(fighterIDs); i++) {
					tX[i] = fighterIDs[i].x + 16;
					tY[i] = fighterIDs[i].y;
				}
				break;
			case "Enemy":
			case "EnemyParty":
			default:
				cursorSpr = sprCursorEnemy;
				break;
		}
		if (is_array(tX)) {
			for (i = 0; i < array_length(tX); i++) {
				draw_sprite(cursorSpr, -1, tX[i], tY[i]);
			}
		} else { draw_sprite(cursorSpr, -1, tX, tY); }
	}
}