var collision = 
	(place_meeting(x, y+1, objPlayer) and objPlayer.face == objPlayer.up) or 
	(place_meeting(x, y-1, objPlayer) and objPlayer.face == objPlayer.down) or 
	(place_meeting(x+1, y, objPlayer) and objPlayer.face == objPlayer.left) or 
	(place_meeting(x-1, y, objPlayer) and objPlayer.face == objPlayer.right);

var da = 0.1
var keyAction = input_check_pressed("confirm");

if (instance_exists(objPlayer)) {
	
		// check if player is touching npc
		if (collision) {
				if (keyAction and !instance_exists(objTextBox) ) {
					instance_create_layer(x, y, layer, objTextBox, {text: other.text} );
					
					var o = objPlayer;
					switch(o.face) {
					
						case o.left:
							face = "right";
							break;
						
						case o.right:
							face = "left";
							break;
						
						case o.up:
							face = "down";
							break;
						
						case o.down:
							face = "up";
							break;
							
					}
				}
				
				drawAction =  (!instance_exists(objTextBox)) ? true : false;
				if (drawAction and daAlpha < 0.9) { daAlpha += da; }
		} else if (daAlpha > 0) { daAlpha -= da; }
		
		// face the player if he is close enough
		var dist = point_distance(x, y, objPlayer.x, objPlayer.y);
		if (dist <= 72 and alarm_get(0) == -1) { alarm[0] = 60; }
		
}