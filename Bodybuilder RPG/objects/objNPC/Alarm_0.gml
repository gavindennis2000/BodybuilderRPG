var o = objPlayer;
if (instance_exists(o)) {
	
	var angle = point_direction(x, y, o.x, o.y);
	if (angle >= 45 and angle < 135) { face = "up"; }
	else if (angle >= 135 and angle < 225) { face = "left"; }
	else if (angle >= 225 and angle < 315) { face = "down"; }
	else { face = "right" };
	
}