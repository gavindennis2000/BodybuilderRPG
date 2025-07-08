function handleNPCs() {
    // sets all the npc ids at the beginning of the room

    with (objNPC) {
        if (npcID != -1)
            exit;

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
            
            // wheyford barbell
            case inst_5DEFDD70:
                npcID = "noob 1";
                break;
            case inst_738322E3:
                npcID = "smol powerlifter 1";
                break;
            case inst_6FF16928:
                npcID = "thicc powerlifter 1";
                face = "left";
                faceStart = face;
                break;
            case inst_3D3CE216:
                npcID = "smol powerlifter 2";
                face = "up";
                faceStart = face;
                break;
            case inst_321F19EA:
                npcID = "thicc powerlifter 2";
                face = "up";
                faceStart = face;
                break;
            case inst_1F3A68E:
                npcID = "super heavyweight 1";
                face = "left";
                faceStart = face;
                break;

            // not found
            default:
                // npcID = "npc not found";
                break;
        }
        if (npcID == -1)
            debug($"NPC not found: {id}");
    }
}