// key event stuff

/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

// check if first time talking to mom
if (room == rMom && !global.keyEvents.meetMom && !global.keyEvents.meetJim) {
    global.keyEvents.meetMom = true;
    createTextbox(
    [
        $"{global.characterName}!?",
        "You overslept! You're going to be late for work!"
    ], 
    false, 
    [
        ["Wow. Was that whole thing just a dream?"], -1, -1, -1
    ], 
    "mom"
    );
}

// first time at pump palace
if (room == rPumpPalace && !global.keyEvents.meetJim) {
	// block off the doors
	with (objDoor) {
		instance_create_layer(x, y, layer, objItem, {
			itemID: "locked door",
			text: [
				"I need to introduce myself to Mr. Ohner before I leave."
			]
		})
	}
}

// enter samuel cutscene
if (room == rOverworld && global.keyEvents.enterSamuel && !global.keyEvents.meetSamuel) {
    global.keyEvents.meetSamuel = true;
    global.cutscene = true;
    with (objPlayer) { cutscene = true; }
    instance_create_layer(objPlayer.x, objPlayer.y + 128, layer, objNPC, {
        npcID: "samuel"
    });
}

// destroy the atlas stone
if (global.keyEvents.atlasStone) {
	with (objItem) {
		if (itemID == "atlas stone") { 
			instance_destroy(); 
		}	
	}
}
instance_destroy();