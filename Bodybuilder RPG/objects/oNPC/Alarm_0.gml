// npc alarm 0
// reset face to face start
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (instance_exists(oTextbox)) {
    alarm_set(0, 90);
    exit;
}

face = faceStart;