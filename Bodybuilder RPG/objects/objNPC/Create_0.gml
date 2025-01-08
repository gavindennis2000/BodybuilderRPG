/*gmlive*/if (TEST) { if (live_call()) return live_result; }
itemID = "npc"
if (!variable_instance_exists(self, "npcID")) { npcID = "npc"; }
event_inherited();
image_speed = 0;
npcImg = 0;

// take care of cutscenes
switch(npcID) {
    case "sulik":
        alarm_set(1, 60);
        targetY = objPlayer.y + 32;
        debug(alarm_get(1));
        face = "up";
        faceStart = "up";
        // play sulik's theme
        with (objMusic) {
            cutscene(sndSulik);
        }
        break;
    default:
        break;
}
