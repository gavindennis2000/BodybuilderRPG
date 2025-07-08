// objWall create

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (room != rOverworld && room != rWheyfordBarbell)
    visible = false;

if (visible)
    layer = layer_create(layer_get_depth(layer_get_id("Instances")) + 1, "Wall");