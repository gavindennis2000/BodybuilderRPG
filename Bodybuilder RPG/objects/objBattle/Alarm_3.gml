// objBattle alarm3 - battle over

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

audio_stop_sound(global.battleMusic);
audio_sound_gain(sndFanfare, 1, 0);
playSound(sndFanfare);
with (objBattleInst) {
    if (side == "party")
        state = "victory";
}
victoryBarX = CAM_WIDTH * 1.5;