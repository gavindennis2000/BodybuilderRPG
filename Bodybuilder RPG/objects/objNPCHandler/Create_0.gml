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
        
        // not found
        default:
            npcID = "npc not found";
            debug($"NPC not found: {id}");
            break;
    }
}