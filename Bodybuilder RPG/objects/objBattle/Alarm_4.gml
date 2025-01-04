// show text for player damage and then get rid of it
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (playerDamageY == -1) {
    alarm[4] = 30;
    playerDamageY = 0;
}
else {
    playerDamageY = -1;
}