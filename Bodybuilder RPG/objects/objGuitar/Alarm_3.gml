/// @description Insert description here
// You can write your code in this editor
room_goto(global.returnRoom);
if (instance_exists(objPlayer)) { instance_destroy(objPlayer); }
instance_create_layer(global.playerX, global.playerY, "Instances", objPlayer);