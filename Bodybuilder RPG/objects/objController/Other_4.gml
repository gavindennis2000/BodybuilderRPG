// objController Room Start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (!instance_exists(objDevTools))
    instance_create_layer(0, 0, "Instances", objDevTools);
if (!instance_exists(objCamera))
    instance_create_layer(0, 0, "Instances", objCamera);