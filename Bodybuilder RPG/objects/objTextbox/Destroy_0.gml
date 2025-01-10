if (action != -1) {
    instance_create_layer(x, y, "Instances", objAction, { prompt: other.action });
}
else if (prompt != false) {
	playSound(sndCursor);
	instance_create_layer(x, y, "Instances", objAction, { selection: other.selection, prompt: other.prompt[2] });
}