/*gmlive*/if (TEST) { if (live_call()) return live_result; }

hSp -= hSpChange;
if (hSp <= -1 || hsp >= 1) {
	hSpChange = -hSpChange;
}

with (objNPC) {
	itemID = "npc";	
}

var drawItem = function(tX, tY, imgIndex) {
	// draw the item using sprItems

	if (tX == -1 || tY == -1) { exit; }
	draw_sprite_part(sprItems, imgIndex, 32*tX, 32*tY, 32, 32, other.x, other.y);	
}

var drawItemMoving = function(tX, tY, imgIndex) {
	// draw the item using sprItems

	if (tX == -1 || tY == -1) { exit; }
	draw_sprite_part(sprItems, imgIndex, 32*tX, 32*tY, 32, 32, other.x, other.y);	
}

var tX = 0, tY = 0, imgIndex = 0;
image_speed = 0.15;

with (objItem) {
	switch (itemID) {
		case "atlas stone":
			tX = 0;
			tY = 1;
			break;	
		case "bed":
			tX = 4;
			tY = 0;
			break;
		case "book":
			if (!place_meeting(x-1, y, objItem)) { tX = 5; }
			else if (!place_meeting(x+1, y, objItem)) { tX = 7; }
			else { tX = 6; }
			tY = 0;
			break;
		case "golden drumstick":
			tX = 11;
			tY = 0;
			break;
		case "locked door":
			tX = -1;
			tY = -1;
			with (other) {
				draw_sprite(sprDoor, 0, other.x, other.y);
			}		
			break;
		case "mirror":
			tX = -1;
			tY = -1;
			with (other) {
				draw_sprite_part(sprItems, 0, 96, 0, 32, 64, other.x, other.y);	 // draw the mirror
				// draw player reflection
				if (instance_exists(objPlayer)) {
					var distX = abs(other.x - objPlayer.x), distY = abs(other.y - objPlayer.y);
					var face = objPlayer.face;
					var index = objPlayer.image_index
					var spr, hair, hood;
					// get the player's direction
					switch (face) {
						case "up":
							spr = sprPlayerDown;
							hair = sprHairDown;
							hood = sprBunnyHoodDown;
							break;
						case "down":
							spr = sprPlayerUp;
							hair = sprHairUp;
							hood = sprBunnyHoodUp;
							break;
						case "left":
							spr = sprPlayerLeft;
							hair = sprHairLeft;
							hood = sprBunnyHoodLeft
							break;
						case "right":
						default:
							spr = sprPlayerRight;
							hair = sprHairRight;
							hood = sprBunnyHoodRight
							break;
					}
					if (distX < 32) and (distY < 64) {
						var sprY = 5-(distY -32) > 0 ? 5-(distY -32) : 0;
						draw_sprite_part_ext(spr, index, 4 + 32*global.outfit.color, sprY, 24 - distX, 17 - (distY-32)*1, other.x+4 + distX, other.y+5 + distY-32, 1, 1, c_white, 0.8);
						draw_sprite_part_ext(hair, index, 4 + 32*global.outfit.hair, sprY + 4, 24 - distX, 17 - (distY-32)*1, other.x+4 + distX, other.y+5 + distY-32, 1, 1, global.outfit.hairColor, 0.8);
						if (global.bunnyHood) { draw_sprite_part_ext(hood, index, 20, sprY + 15, 24 - distX, 17 - (distY-32)*1, other.x+4 + distX, other.y+5 + distY-32, 1, 1, c_white, 0.8); }
					}
				}
			}		
			break;
		case "nectar of the guardians":
			tX = 10;
			tY = 0;
			break;
		case "sign":
			tX = 8;
			tY = 0;	
			break;
		case "squat rack":
			tX = 3;
			tY = 1;
			break;
		case "trapezius of power":
			tX = 12;
			tY = 0;
			break;
		case "treadmill":
			tX = 9;
			tY = 0;
			imgIndex = -1;
			break;
		case "tv":
			tX = -1;
			tY = -1;
			with (other) {
				draw_sprite_part(sprItems, 0, 64, 0, 32, 64, other.x, other.y);	
			}		
			break;
		// ignore npc's
		case "npc":
			tX = -1;
			tY = -1;
			break;
		// draw items that don't exist yet
		default:
			tX = 0;
			tY = 0;		
			break;
	}
	with (other) { drawItem(tX, tY, imgIndex); }
}