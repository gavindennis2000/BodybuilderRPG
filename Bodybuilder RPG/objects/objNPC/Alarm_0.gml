// objNPC alarm 0
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (!instance_exists(objTextbox) && array_length(directions) == 0)
    face = faceStart;