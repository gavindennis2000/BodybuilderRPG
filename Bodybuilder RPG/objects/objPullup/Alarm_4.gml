/// @description Insert description here
// You can write your code in this editor
if (fadeAlpha < 1) {
	fadeAlpha += 0.2;
	alarm[4] = 2;
} else {
	global.roomID = "mason";
	room_goto(rHouse);
	with (instance_create_layer(320, 384-32, "Instances", objPlayer)) { face = "up"; };
}