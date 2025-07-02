// objNPC create

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// set animation to off
image_speed = 0;
image_index = 0;
faceStart = (variable_instance_exists(self, "faceStart")) ? faceStart : face;
depthStart = depth;
flashing = variable_instance_exists(self, "flashing") ? flashing : false;
flashCounter = 0;

// handle moving npcs
xTo = x;
yTo = y;
if (array_length(directions) > 0)
    alarm[1] = 1;

// handle player interactions
touching = false;
alreadyTalked = false;