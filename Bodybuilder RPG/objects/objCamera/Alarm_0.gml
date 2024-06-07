/// @description start battle
initBattle = false;
camera_set_view_angle(view_camera[0], 0);
instance_destroy(objPlayer);
room_goto(roomBattle);
whiteOut = true;