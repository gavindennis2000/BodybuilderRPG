// npc create
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

npcID = variable_instance_exists(self, "npcID") ? npcID : "npc";
face = variable_instance_exists(self, "face") ? face : "down";
faceStart = face;
sprite_index = sprNPC;
hasTalked = false;