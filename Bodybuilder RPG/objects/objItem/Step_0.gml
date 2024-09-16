/// @description Insert description here
var keyConfirm = input_check_pressed("south");
var touching = false; //var dist = -1;
if (instance_exists(objPlayer)) { 
	// check if sign is touching player
	touching = objPlayer.canMove and ( 
		(place_meeting(x+1, y, objPlayer) and objPlayer.face == "left") or 
		(place_meeting(x-1, y, objPlayer) and objPlayer.face == "right") or 
		(place_meeting(x, y-1, objPlayer) and objPlayer.face == "down") or 
		(place_meeting(x, y+1, objPlayer)and objPlayer.face == "up") 
	)
	dist = sqrt(sqr(objPlayer.x - x) + sqr(objPlayer.y - y));
}

glowAlpha += glowAlphaChange;
if (glowAlpha >= 1) { glowAlphaChange = -0.025; }
else if (glowAlpha <= 0) { glowAlphaChange = 0.025; }
	
if (touching and keyConfirm and !instance_exists(objTextbox)) {
	// if npc, face the player 
	if (object_index == objNPC) {
		face = objPlayer.face;
		switch(face) {
			case "right":
				face = "left";
				break;
			case "left":
				face = "right";
				break;
			case "up":
				face = "down";
				break;
			case "down":
			default:
				face = "up";
				break;
		}
		if (alarm_get(0) > -1) { alarm[0] = -1; }
	}
	// create the textbox
	if (!is_array(text[0])) { text = [text]}
	instance_create_layer(x, y, layer, objTextbox, {text: other.text[other.textIndex], prompt: other.prompt, npcID: npcID });
	textIndex++;
	if (textIndex > textIndexMax) { textIndex = textIndexMax; }
	
}