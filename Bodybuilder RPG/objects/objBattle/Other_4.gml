/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (room == rBattle) {
    layer = layer_get_id("Instances");
    var cam = view_camera[0];
    
    camera_set_view_size(cam, 480, 270);
    camera_set_view_pos(cam, 0, 0);
    camera_set_view_angle(cam, 0);
}