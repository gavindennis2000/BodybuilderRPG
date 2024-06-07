targetX = x;
targetY = y;
steps = 0;
	
if (!instance_exists(objPause))
	instance_create_layer(x, y, layer, objPause);