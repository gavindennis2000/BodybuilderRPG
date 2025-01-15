// flash game over message and options

// stop all the music
audio_stop_all();
instance_destroy(objMusic);

// game over textbox
instance_create_layer(x, y, "Instances", objTextbox, {
    screen: "bottom",
    text: [
        $"{global.characterName} has blacked out.",
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