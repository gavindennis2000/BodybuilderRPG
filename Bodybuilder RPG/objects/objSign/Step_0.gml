var keyAction = input_check_pressed("confirm");

if (instance_exists(objPlayer)) {

	if (keyAction and !instance_exists(objTextBox) ) {
		if
			(place_meeting(x, y+1, objPlayer) and objPlayer.face == objPlayer.up) or 
			(place_meeting(x, y-1, objPlayer) and objPlayer.face == objPlayer.down) or 
			(place_meeting(x+1, y, objPlayer) and objPlayer.face == objPlayer.left) or 
			(place_meeting(x-1, y, objPlayer) and objPlayer.face == objPlayer.right) {
			
				instance_create_layer(x, y, layer, objTextBox, {text: other.text} );		
			
			}
	}
}