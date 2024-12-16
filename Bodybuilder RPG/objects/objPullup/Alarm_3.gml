/// @description announce winner.
if (victoryTextScale == 0) {
	victoryTextScale = 1;
	
if (playerPullups == otherPullups) { victor = "TIE"; }
	victor = playerPullups > otherPullups ? "YOU WIN!" : "YOU LOSE.";
} else if (victoryTextScale >= 2 and alarm_get(4) <= 0) {
	alarm[4] = 1
}