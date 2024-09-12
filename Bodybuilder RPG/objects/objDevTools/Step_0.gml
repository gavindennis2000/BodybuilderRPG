if (global.devTools) {
	if (keyboard_check_pressed(ord("G"))) { game_restart(); }
	if (keyboard_check_pressed(ord("R"))) { room_restart(); }
	if (keyboard_check_pressed(ord("F"))) { showDevTools = showDevTools ? false : true; }
	if (keyboard_check_pressed(ord("H"))) { global.bunnyHood = global.bunnyHood ? false : true; }
	if (keyboard_check_pressed(ord("B"))) { global.bicycle = global.bicycle ? false : true; }
	if (keyboard_check_pressed(ord("L"))) { room_set_live(room, live ? false : true); live = live ? false : true}
}