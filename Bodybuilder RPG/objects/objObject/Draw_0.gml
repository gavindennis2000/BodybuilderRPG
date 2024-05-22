var action = sprOrbRead;
var spr = sprSign;

// decide which sprite index to use
switch(obj) {
	case "mirror":
		action = sprOrbExamine;
		spr = sprMirror;
		break;
	case "sign":
		action = sprOrbRead;
		spr = sprSign;
		break;
	case "object":
	default:
		action = sprOrbRead;
		spr = -1
		break;
}

// draw the mirror objects
if (obj == "mirror") {
	var dist = 100;
	var pSpr = -1;
	var pSub = 0;
	if (instance_exists(objPlayer)) { 
		switch (objPlayer.face) {
			case objPlayer.left:
				pSpr = sprPlayerLeft;
				break;
			case objPlayer.right:
				pSpr = sprPlayerRight;
				break;
			case objPlayer.up:
				pSpr = sprPlayerDown;
				break;
			case objPlayer.down:
				pSpr = sprPlayerUp;
				break;
		}
		pSub = (objPlayer.walking) ? -1 : 0;
		xDist = objPlayer.x - x;
		yDist = objPlayer.y - y;
		var tempDepth = depth;
		if (yDist < 64 && (objPlayer.x < x+32 and objPlayer.x >= x) ) {
			image_speed = objPlayer.image_speed/2;
			draw_sprite_part_ext(pSpr, pSub, 0-xDist,0-yDist+32,32,24,x, y+2, 1, 1, image_blend, 0.75)
		}
	}
}

var i = 6;
//draw_self();
if (spr != -1) { draw_sprite_ext(spr, image_index, x, y-i, 1, 1, image_angle, image_blend, image_alpha); }

// draw the orb that tells the player what to do
if (drawAction) {
	draw_sprite_ext(action, 0, x+16, y-15, 1, 1, image_angle, image_blend, daAlpha);
}