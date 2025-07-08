// objBattle alarm2 - game over

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var continueFromLast = function() {
    audio_stop_sound(global.battleMusic);
    continueFromLastSave();
}
var goToMain = function() {
    audio_stop_sound(global.battleMusic);
    goToMainMenu();
}

if (fadeBlack == -1)
    fadeBlack = 0;

else if (fadeBlack >= 0.85) {
    textbox([
        {
            text: array_length(global.battleData.party) == 1 ? $"{string_upper(global.characterName)} got mogged by the enemies and blacked out..." : $"The party got mogged by the enemies and blacked out..."
        },
        {
            text: "Continue from last save?",
            prompt: [
                "Yes",
                continueFromLast,
                "No",
                goToMain
            ]
        }
    ])
    exit;
}
else
    fadeBlack += 0.01;

// reset the alarm
alarm_set(2, 2);