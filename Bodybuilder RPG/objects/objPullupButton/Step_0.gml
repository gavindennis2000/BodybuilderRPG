var aTime = 2;
var success = ( 
	(input_check_pressed("south") and button == 0) or 
	(input_check_pressed("east") and button == 1) or 
	(input_check_pressed("north") and button == 2) or 
	(input_check_pressed("west") and button == 3) 
)
var fail = ( 
	
	( (input_check_pressed("east") or input_check_pressed("south") or input_check_pressed("north") )
	and button == 3) or 
	
	( (input_check_pressed("west") or input_check_pressed("south") or input_check_pressed("east") )
	and button == 2) or 
	
	( (input_check_pressed("west") or input_check_pressed("south") or input_check_pressed("north") )
	and button == 1) or 
	
	( (input_check_pressed("west") or input_check_pressed("east") or input_check_pressed("north") )
	and button == 0)
)

if (fail and !disable) {
	failure = true;
	alarm[0] = aTime
	with (objPullup) {
		image_speed /= 2
	}
}

else if (success and !disable) {
	disable = true;
	alarm[0] = aTime;
	
	with (objPullup) {
		if (image_speed == 0) {
			image_speed = 0.1;	
		}
		else { image_speed += 0.03; }
	}
}

