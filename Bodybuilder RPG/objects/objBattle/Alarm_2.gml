// show text for enemy damage and then get rid of it
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (enemyDamageY == -1) {
    alarm[2] = 30;
    enemyDamageY = 0;
}
else {
    enemyDamageY = -1;
}