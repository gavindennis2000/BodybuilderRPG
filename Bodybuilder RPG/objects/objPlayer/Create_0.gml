// objPlayer create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Player");

// movement stuff
targetX = 0;
targetY = 0;
canMove = true;
canCertainlyMove = true;
image_speed = 0;

// player's running speed and animation
runSpeedAnimation = 0.2;
originalRunSpeedAnimation = runSpeedAnimation;
runSpeed = 2;
originalRunSpeed = runSpeed;
ko = false;