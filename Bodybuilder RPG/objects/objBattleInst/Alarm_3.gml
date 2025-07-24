// objBattleInst alarm3 - skill animation effect

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var skillAlphaChange = 0.1;
if (skillDir == "up") {
    if (skillAlpha < 0.9) {
        skillAlpha += skillAlphaChange;
        alarm_set(3, 1);
        exit;
    }
    else {
        skillDir = "down";
        var snd = skillSound == -1 ? sndBuffer : skillSound;
            playSound(skillSound);
        alarm_set(3, 1);
        exit;
    }
}
else if (skillDir == "down") {
    if (skillAlpha > 0) {
        skillAlpha -= skillAlphaChange;
        alarm_set(3, 5);
        exit;
    }
    else {
        skillAlpha = 0;
        skillDir = "up";
        skillY = 0;
        exit;
    }
}