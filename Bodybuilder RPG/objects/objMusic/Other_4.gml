switch (room) {
	
	case momB:
	case momF1:
		nextSong = sndMom;
		break;
		
	case centralPrairie:
		nextSong = sndCentralPrairie;
		break;
		
	default:
		break;
}

// if the song changed, fade the current song and play the next
if (nextSong != currentSong) { playNextSong(); }