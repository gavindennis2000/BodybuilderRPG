// populate the houses with their respective people and luxurious furniture

switch(global.roomID) {
	case "harvey":
        with (objDoor) {
            roomID = -1
            goTo = rOverworld;
            pX = 3520;
            pY = 1888 + 32;
            pFace = "down";	
        }
        // create harveys mom
        instance_create_layer(320, 224, layer, objNPC, {
            npcID: "harvey's mom"
        });
        break;
	case "mason":
        with (objDoor) {
            roomID = -1
            goTo = rOverworld;
            pX = 3136;
            pY = 2144 + 32;
            pFace = "down";	
        }
        // create mason
        instance_create_layer(320, 224, layer, objNPC, {
            npcID: "mason"
        });
        break;
		
	case "mom":
        with (objDoor) {
            roomID = -1
            goTo = rOverworld;
            pX = 3520;
            pY = 2144 + 32;
            pFace = "down";	
        }
        // create bookshelves
        with instance_create_layer(128, 128, layer, objItem) { itemID = "book"; text = ["The Rapid Fat Loss Handbook by Lyle McDonald."]; }
        with instance_create_layer(128 + 32, 128, layer, objItem) {itemID = "book"; text = ["ProgrammingToWin by Izzy Narvaez."]; }
        with instance_create_layer(128 + 64, 128, layer, objItem) {itemID = "book"; text = ["The Art and Science of Lifting by Greg Knuckols and Omar Isuf."]; }
        with instance_create_layer(128 + 96, 128, layer, objItem) {itemID = "book"; text = ["Scientific Principles of Hypertrophy Training by Dr. Mike Israetel et al."]; }
    
        // create mom
        instance_create_layer(320, 224, layer, objNPC, {npcID: "mom"})
    
        // create stairs
        with (instance_create_layer(512, 128, layer, objDoor)) {
            doorID = "downstairs";
            roomID = -1;
            goTo = rMom;
            pX = 512 - 32;
            pY = 160;
            pFace = "left";
        }
        // we're done
        break;
    case "":
        break;
}