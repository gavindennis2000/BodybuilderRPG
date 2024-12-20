/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// Inherit the parent event
event_inherited();

if (face != faceStart and !instance_exists(objTextbox) and alarm_get(0) <= 0) { alarm[0] = 120; }