// objBattle alarm1 - battle end

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// if player health is 0, set it to 1
for (var i = 0; i < array_length(myParty); i++) {
    if (myParty[i].stats.hp <= 0)
        myParty[i].stats.hp = 1;
}
with (objController)
    goToNextRoom();

audio_sound_gain(sndFanfare, 0, 1000);