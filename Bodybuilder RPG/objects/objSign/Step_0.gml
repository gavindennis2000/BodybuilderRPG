var collision = 
	(place_meeting(x, y+1, objPlayer) and objPlayer.face == objPlayer.up) or 
	(place_meeting(x, y-1, objPlayer) and objPlayer.face == objPlayer.down) or 
	(place_meeting(x+1, y, objPlayer) and objPlayer.face == objPlayer.left) or 
	(place_meeting(x-1, y, objPlayer) and objPlayer.face == objPlayer.right);

var da = 0.1
var keyAction = input_check_pressed("confirm");

if (instance_exists(objPlayer)) {
	
		if (collision)
			{
				if (keyAction and !instance_exists(objTextBox) ) {
					instance_create_layer(x, y, layer, objTextBox, {text: other.text} );		
				}
				
				drawAction =  (!instance_exists(objTextBox)) ? true : false;
				if (drawAction and daAlpha < 0.9) { daAlpha += da; }
			}
		else if (daAlpha > 0) daAlpha -= da
}