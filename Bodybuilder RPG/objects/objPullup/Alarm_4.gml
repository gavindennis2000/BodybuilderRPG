/// @description Insert description here
// You can write your code in this editor
if (fadeAlpha < 1) {
	fadeAlpha += 0.2;
	alarm[4] = 2;
} else {
	global.roomID = "mason";
	room_goto(rHouse);
	with (instance_create_layer(320, 224+32, layer, objPlayer)) { face = "up"; };
	var txt = [""];
	if (playerPullups >= 100) { 
		txt = [
		["Holy cow! You've made some crazy back gains.", 
		"I don't think there's any more I can teach you today.",
		"Come see me tomorrow if you're not too sore!"]
		]
	}
	else if (playerPullups >= otherPullups) {
		txt = [
			["That was mighty impressive. I bet you'd have 100 in you if you really tried!",
			"Let's do that again soon."]
		]
	}
	else {
		txt = [
			["You still have some catching up to do!", "Don't fret. It takes a long time to build a huge back!"]		
		]	
	}
}