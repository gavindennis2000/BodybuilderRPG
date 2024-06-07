/// @description check if out of health
if (hp <= 0 and state != "ko") {
	state = "ko";
	if (isEnemy) { audio_play_sound(sndEnemyDeath, 1, false); }
	ko = true;
	hp = 0;
	with (objBattle) {
		removeQueue(other.id);	
	}
}