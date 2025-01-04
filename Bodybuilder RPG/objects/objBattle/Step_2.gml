// handle screen shake
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (room != rBattle) exit;

// get the camera info
var cam = view_camera[0];
var camX = camera_get_view_x(cam), camY = camera_get_view_y(cam);
var camW = camera_get_view_width(cam), camH = camera_get_view_height(cam);

// apply shake
var shakePower = 2;
var shake = power(shakeValue, 2) * shakePower;
camX += random_range(-shake, shake);
camY += random_range(-shake, shake);

// adjust camera to follow suit
camera_set_view_pos(cam, camX, camY);
camera_set_view_size(cam, camW, camH);
camera_set_view_angle(cam, random_range(-shake, shake) * 0.5);

// reduce shake value
if (shakeValue > 0) { shakeValue -= 0.1; }