if (prompt != false) {
	var snd = (selection == 0) ? sndAccept : sndDecline;
	playSound(snd);
	instance_create_layer(x, y, "Instances", objAction, { selection: other.selection, prompt: other.prompt[2] });
}