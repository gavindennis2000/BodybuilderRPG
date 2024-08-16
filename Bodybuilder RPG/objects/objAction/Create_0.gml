switch(prompt) {
	
	case 1:
		// bench press at home
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				actionRoom = roomGuitar;
			}
		}
		break;
	case 2:
		// ask to work in for dumbbell flyes
		if (selection == 0) {
			var txt = ["I really should focus on compound movements for now..."]
			instance_create_layer(x, y, layer, objTextbox, {text: txt});
		}
		break;
	case 3:
		// hit some dumbbell bench
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				/*temporary*/actionRoom = roomGuitar;
			}
		}
		else if (selection == 1) { instance_destroy(); }
		break;
	case 4:
		// hit some squats
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "novice leg";
				actionRoom = roomGuitar;
			}
		}
		break;
	case 6:
		// move the atlas stone
		if (selection == 0) {
			with (objPlayer) { canMove = false; face = "left"; }
			with (objItem) { 
				if (itemID == "atlas stone") {
					y = objPlayer. y - 32;
					hspeed = -10;
					gravity = 0.2;
				}
			}
			instance_create_layer(x, y, layer, objTextbox, { text: ["Wow! Unlimited grip strength!"] });
		}
		break;
	case 7:
		// drink from the chocolate milk lake
		if (selection == 0) {
			var txt = ["Yeah... That is not chocolate milk."]
			instance_create_layer(x, y, layer, objTextbox, {text: txt});
		}
		break;
}

instance_destroy();