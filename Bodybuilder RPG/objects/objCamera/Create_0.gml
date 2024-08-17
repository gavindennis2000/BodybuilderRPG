camWidth = 480;
camHeight = 270;
cam = view_camera[0];
camX = camera_get_view_x(cam);
camY = camera_get_view_y(cam);
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);
camera_set_view_border(cam, 240, 135);

if (instance_exists(objPlayer)) { follow = objPlayer; }
else { follow = noone; }

xTo = x;
yTo = y;

section = -1;
prevSection = -1;
tempSection = -1;
transition = false;

xDist = -1;
yDist = -1;

town = -1;