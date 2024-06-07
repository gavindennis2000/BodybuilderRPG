// initiate battle
if keyboard_check_pressed(ord("B")) {
	objCamera.initiateBattle();
}
if keyboard_check_pressed(ord("R")) {
	game_restart();
}

if keyboard_check_pressed(ord("E")) {
	global.noEncounters = (global.noEncounters) ? false : true;
}