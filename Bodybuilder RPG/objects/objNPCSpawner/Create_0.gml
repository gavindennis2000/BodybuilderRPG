// spawns npc objects in the overworld and gyms

var l = "Instances";
switch (global.chapter) {
    case 1:
        switch (room) {
            case rOverworld:

                break;
            case rPumpPalace:
                instance_create_layer(192, 160, l, objNPC, {npcID: "gym rat 3"});
                instance_create_layer(192, 320, l, objNPC, {npcID: "gym rat 2"});
                instance_create_layer(640, 192, l, objNPC, {npcID: "gym rat 1"});
                instance_create_layer(480, 352, l, objNPC, {npcID: "jim"});
                break;
            default:
                break;
        }
        break;
}

instance_destroy();