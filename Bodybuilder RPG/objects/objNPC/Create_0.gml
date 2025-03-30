/*gmlive*/if (TEST) { if (live_call()) return live_result; }
itemID = "npc"
if (!variable_instance_exists(self, "npcID")) { npcID = "npc"; }
event_inherited();
image_speed = 0;
image_index = 0;
npcImg = 0;
npcHair = -1;
npcHairColor = c_white;

// take care of cutscenes
switch(npcID) {
    case "samuel":
        alarm[1] = 60;
        targetY = objPlayer.y + 32;
        face = "up";
        faceStart = "up";
        // play samuel's theme
        with (objMusic) {
            cutscene(sndSamuel);
        }
        with (objItem) {
            if (itemID == "locked door" && y == 2176 - 32) {
                itemID = "door";
            }
        }
        break;
}
