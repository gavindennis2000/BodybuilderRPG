if (!global.keyEvents.unlockedDoor) {
    instance_create_layer(x, y, layer, objItem, {
        text: ["The door is locked."], 
        itemID: "locked door"
    });
    instance_destroy();
}

roomID = "academic research center";
goTo = rHouse;
pX = 320;
pY = 384 - 32;
pFace = "up";