/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (instance_exists(oPlayer)) {
    oPlayer.canMove = canMove;
}