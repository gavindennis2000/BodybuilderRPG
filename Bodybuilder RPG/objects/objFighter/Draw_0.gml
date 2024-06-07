//draw_text(x, y-32, fighter);

switch (fighter) {
	case "Ben":
	default:
		switch(state) {
			case "wait":
			default:
				sprite_index = sprPlayerLeft;
				image_index = 0;
				image_speed = 0;
				break;
			case "attack":
				sprite_index = sprPlayerLeft;
				image_index = 0;
				image_speed = 0;
				break;
			case "run":
				sprite_index = sprPlayerLeft;
				image_speed = 0.4;
				break;
		}
		break;
}

x -= 16;
y -= 16;
if ko image_blend = c_red;
event_inherited();


x += 16;
y += 16;

if (fadeRoom > 0)
	exit;

if (instance_exists(objBattle)) {
	// draw the dashboard
	if (
		!objBattle.battleStart or
		objBattle.victory or 
		objBattle.gameOver 
		) { exit; }
	
	// draw the character names
	draw_set_font(fntTextBox);
	fontX(fa_right);
	fontY(fa_bottom);
	var yDis = 18;
	var nameX = 320 - 8;
	var nameY = 229 + fighterID*yDis
	draw_text_border(nameX, nameY, global.characters[fighterID], c_white, 1);
	
	// draw the health 
	draw_set_font(fntHealth);
	fontX(fa_left);
	var healthX = 320;
	var healthY = nameY - 6;
	var hpText = string(hp) + "/" + string(maxhp);
	draw_text_border(healthX, healthY, "HP", c_blue, 1);
	draw_text_border(healthX + 100, healthY, "SK", c_red, 1);
	fontX(fa_right);
	draw_text_border(healthX+90, healthY, hpText, c_white, 1);
	draw_text_border(healthX+140, healthY, sk, c_white, 1);
	
	// draw a box if its your turn
	var turnX = 252-4; var turnY = 226 + fighterID*yDis - yDis;
	var turnHeight = 8; var turnLength = healthX+140;
	if (objBattle.turn == self.id) { draw_sprite_ext(sprTurn, 0, turnX, turnY, 1, 1, image_angle, image_blend, 0.3); }
	
	//draw the overdrive bar
	var odX = 320;
	var odY = 223;
	draw_rectangle_color(odX, odY + fighterID*yDis, room_width - 8, odY + fighterID*yDis + 1, c_black, c_black, c_black, c_black, false);
	
}
//draw_text(x, y, room_width/2+70);