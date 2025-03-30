/*gmlive*/if (TEST) { if (live_call()) return live_result; }

hSp -= hSpChange;
hSpChange *= 1.05;
if (hSp <= -2 || hSp >= 2) {
	hSpChange = -0.1 * -sign(hSp);
}

with (objNPC) {
	itemID = "npc";	
}

var drawItem = function(tX, tY, imgIndex) {
	// draw the item using sprItems

	if (tX == -1 || tY == -1) { exit; }
	draw_sprite_part(sprItems, imgIndex, 32*tX, 32*tY, 32, 32, other.x, other.y);	
}

var drawItemMoving = function(tX, tY, imgIndex, hSp = objItemTiles.hSp) {
	// draw the item using sprItems

	if (tX == -1 || tY == -1) { exit; }
	draw_sprite_part(sprItems, imgIndex, 32*tX, 32*tY + hSp, 32, 32, other.x, other.y);	

	draw_ellipse_color(other.x + 8, other.y + 34, other.x + 24, other.y + 38, c_black, c_black, false);
}

var tX, tY, imgIndex = 0;
image_speed = 0.15;

with (objItem) {
	tX = -1;
	tY = -1;
	switch (itemID) {
		case "atlas stone":
			tX = 0;
			tY = 1;
			break;	
		case "bed":
			tX = 4;
			tY = 0;
			break;
		case "bench press":
			draw_sprite(sprItemsWorkout, 0, x - 32, y - 32);
			break;
		case "book":
			if (!place_meeting(x-1, y, objItem)) { tX = 5; }
			else if (!place_meeting(x+1, y, objItem)) { tX = 7; }
			else { tX = 6; }
			tY = 0;
			break;
		case "chest flyes":
			image_speed = 0.8;
			sprite_index = sprChestFlyes
			mask_index = sprWall;
			draw_sprite(sprite_index, -1, x - 32, y - 32);
			break;
		case "db bench":
			tX = -1;
			tY = -1;
			draw_sprite(sprItemsWorkout, 1, x - 32, y - 32);
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
			draw_sprite(sprItemsWorkout, 2, x - 32, y - 32);
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
	if (itemID == "nectar of the guardians" ||
		itemID == "golden drumstick" ||
		itemID == "trapezius of power"
	) {
		with (other) { 
			drawItemMoving(tX, tY, imgIndex); 
		}
	}
	else {
		with (other) { 
			drawItem(tX, tY, imgIndex); 
		}
	}
}