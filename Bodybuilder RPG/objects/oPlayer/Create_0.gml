// objPlayer create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Player");

// movement stuff
targetX = 0;
targetY = 0;
canMove = variable_instance_exists(self, "canMove") ? canMove : true;
canCertainlyMove = true;
image_speed = 0;
runSpeed = 2;
originalRunSpeed = 2;
runCounter = 0;