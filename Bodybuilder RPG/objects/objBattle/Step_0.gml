// move the cursor
switch (dashboard) {
	case "Menu":
		displayOptions[0] = "Attack";
		displayOptions[1] = "Skill";
		displayOptions[2] = "Gymbag";
		displayOptions[3] = "Run";
		break;
	case "Skill":
		displayOptions[0] = turn.skills[0 + scroll];
		displayOptions[1] = turn.skills[1 + scroll];
		displayOptions[2] = turn.skills[2 + scroll];
		displayOptions[3] = turn.skills[3 + scroll];
		break;
	default:
		break;
}

var keyDown = input_check_pressed("down");
var keyUp = input_check_pressed("up");
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");

var confirm = input_check_pressed("confirm");
var cancel = input_check_pressed("cancel");

if (battleStart and !showText) {
	// cursor movement
	if (keyDown) {
		if (cursor < 2) {
			cursor += 2;
			audio_play_sound(sndCursor, 1, false);
		}
	}
	else if (keyUp) {
		if (cursor > 1) { 
			cursor -= 2; 
			audio_play_sound(sndCursor, 1, false);
		}
	}
	else if (keyLeft) {
		if cursor%2 == 1 { 
			cursor--; 
			audio_play_sound(sndCursor, 1, false);
		}
	}
	else if (keyRight) {
		if cursor%2 == 0 { 
			cursor++; 
			audio_play_sound(sndCursor, 1, false);
		}
	}
	
	// cancel and confirm
	if (confirm) {
		switch(displayOptions[cursor]) {
			case "Attack":
				playSound(sndCursor);
				break;
			case "Skill":
				playSound(sndCursor);
				dashboard = "Skill";
				cursor = 0;
				scroll = 0;
				break;
			case "Gymbag":
				playSound(sndCursor);
				dashboard = "Gymbag";
				cursor = 0;
				scroll = 0;
				break;
			case "Run":
				playSound(sndCursor);
				break;
		}
	}
	if (cancel) {
		switch(dashboard) {
			case "Menu":
				playSound(sndError);
				break;
			case "Skill":
				playSound(sndCancel);
				dashboard = "Menu";
				break;
			case "Gymbag":
				dashboard = "Menu";
				playSound(sndCancel);
				break;
			case "Run":
				dashboard = "Menu";
				playSound(sndCancel);
				break;
		}
	}
}