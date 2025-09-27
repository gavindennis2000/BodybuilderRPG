// check if controller obj exists and create it if it doesn't

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!instance_exists(oController))
    instance_create_layer(0, 0, "Instances", oController);