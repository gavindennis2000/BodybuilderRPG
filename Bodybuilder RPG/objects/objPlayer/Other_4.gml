targetX = x;
targetY = y;

if (!instance_exists(objCamera))
	instance_create_layer(x, y, layer, objCamera);
	
if (!instance_exists(objPause))
	instance_create_layer(x, y, layer, objPause);