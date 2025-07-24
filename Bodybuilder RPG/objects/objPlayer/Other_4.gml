/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (room == rSpace) {
    spaceFog = 1;
    playSound(sndTeleport);
    face = "up";
}

canMove = false;