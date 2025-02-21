// flash game over message and options

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// stop all the music
audio_stop_all();
instance_destroy(objMusic);

// stop any battle
if (instance_exists(objBattle)) { instance_destroy(objBattle); }
global.battle = false;

// destroy the player instance
if (instance_exists(objPlayer)) { instance_destroy(objPlayer); }

// game over textbox
instance_create_layer(x, y, "Instances", objTextbox, {
    screen: "bottom",
    text: [
        $"{global.characterName} has blacked out due to fatigue.",
        "Try Again?"
    ],
    prompt: [
        "Yes",
        "No",
        "game over"
    ]
});

// destroy this instance
instance_destroy();