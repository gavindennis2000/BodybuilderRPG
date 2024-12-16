if (TEST) { if (live_call()) return live_result; }

// set previous music
previous = current;

switch (room) {
	case rOverworld:
		current = sndCentralPrairie
		break;
	case rHouse:
		current = (global.roomID == "mom") ? sndMom : sndCentralPrairie;
		break;
	case rMom:
		current = sndMom
		break;
	case rPumpPalace:
		current = sndPumpPalace
		break;
}

// play the music
alarm[0] = 30