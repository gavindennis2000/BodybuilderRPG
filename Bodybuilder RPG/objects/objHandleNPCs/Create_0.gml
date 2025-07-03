// objItemHandler create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

with (objNPC) {
    switch (id) {
        // mom's house
        case inst_25C30024:
            npcID = "mom";
            break;

        // pump palace
        case inst_2EDD4AC:
            npcID = "jim";
            break;
        
        // stores
        // bbnc
        case inst_3367C1FA:
            npcID = "clerk";
            break;
        
        // not found
        default:
            // npcID = "npc not found";
            break;
    }
    if (npcID == -1)
        debug($"NPC not found: {id}");

}