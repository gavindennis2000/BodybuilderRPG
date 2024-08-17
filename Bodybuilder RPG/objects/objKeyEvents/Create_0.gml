/// @description perform key events


function keyEvents(event, isTrue) {
	switch(event) {
		case "locked door":
			if (isTrue) {
				with (inst_15D7EF6A) {
					with instance_create_layer(x, y, layer, objItem) {
						text = ["The door is locked"];
						itemID = "door";
					}
					instance_destroy();
				}
			}
			break;
		case "atlas stone":
			if (isTrue) {
				with (objItem) {
					if (itemID == "atlas stone") { instance_destroy(); }	
				}
			}
			break;
	}
}

for (var i = 0; i < array_length(global.keyEvents); i++) {
	keyEvents(global.keyEvents[i][0], global.keyEvents[i][1])
}
instance_destroy();