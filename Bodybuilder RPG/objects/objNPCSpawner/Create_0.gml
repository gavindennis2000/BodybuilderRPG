// spawns npc objects in the overworld and gyms

createNPC = function(npcX, npcY, npc) {
    // easier function to create npcs

    instance_create_layer(npcX, npcY, "Instances", objNPC, {npcID: npc});
}

var l = "Instances";
switch (global.chapter) {
    case 1:
        switch (room) {
            case rOverworld:
                createNPC(3744, 1280, "person 1");
                createNPC(2688, 2080, "old person 1");
                createNPC(2560, 1632, "harvey");
                break;
            case rPumpPalace:
                createNPC(192, 160, "gym rat 3");
                createNPC(192, 320, "gym rat 2");
                createNPC(640, 192, "gym rat 1");
                createNPC(480, 352, "jim");
                break;
            default:
                break;
        }
        break;
}

instance_destroy();