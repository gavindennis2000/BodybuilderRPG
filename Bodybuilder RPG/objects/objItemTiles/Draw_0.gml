with (objNPC) {
	itemID = "npc";	
}
with (objItem) {
	
	switch (itemID) {
		case "book":
			drawSelf = false;
			var tNum = 1;
			if (!place_meeting(x-1, y, objItem)) {
				tNum = 0;
			}
			else if (!place_meeting(x+1, y, objItem)) {
				tNum = 2;
			}
			else { tNum = 1; }
			with (other) {
				draw_sprite_part(sprItems, 0, 32*(5+tNum), 0, 32, 32, other.x, other.y);	
			}
			break;
		case "tv":
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 64, 0, 32, 64, other.x, other.y);	
			}		
			break;
		case "mirror":
			drawSelf = false;
			with (other) {
				if TEST { draw_sprite(sprWall, 0, other.x, other.y); }  // draw the wall
				draw_sprite_part(sprItems, 0, 96, 0, 32, 64, other.x, other.y);	 // draw the mirror
				// draw player reflection
				if (instance_exists(objPlayer)) {
					var distX = abs(other.x - objPlayer.x); var distY = abs(other.y - objPlayer.y);
					var face = objPlayer.face;
					var spr = sprPlayerDown;
					var index = objPlayer.image_index
					// get the player's direction
					switch (face) {
						case "up":
							spr = sprPlayerDown;
							break;
						case "down":
							spr = sprPlayerUp;
							break;
						case "left":
							spr = sprPlayerLeft;
							break;
						case "right":
							spr = sprPlayerRight;
							break;
					}
					if (distX < 32) and (distY < 64) {
						var sprY = 5-(distY -32) > 0 ? 5-(distY -32) : 0;
						draw_sprite_part_ext(spr, index, 4, sprY, 24 - distX, 17 - (distY-32)*1, other.x+4 + distX, other.y+5 + distY-32, 1, 1, c_white,0.8);
					}
				}
			}		
			break;
		case "bed":
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 32*4, 0, 32, 32, other.x, other.y-4);	
			}		
			break;
		case "sign":
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 32*8, 32*0, 32, 32, other.x, other.y);	
			}		
			break;
		case "door":
			drawSelf = false;
			with (other) {
				draw_sprite(sprDoor, 0, other.x, other.y);
			}		
			break;
		case "treadmill":
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 32*9, 32*0, 32, 32, other.x, other.y);	
			}		
			break;
		case "npc":
			break;
		case "atlas stone":
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 32*10, 32*0, 32, 32, other.x, other.y);	
			}		
			break;	
		
		default:
			drawSelf = false;
			with (other) {
				draw_sprite_part(sprItems, 0, 0, 32*0, 32, 32, other.x, other.y);	
			}		
			break;
	}
	
}