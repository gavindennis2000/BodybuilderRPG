/// @description create the picks
for (i = 3; i <= 6; i++) {
	instance_create_layer(room_width - 32*i, room_height *3/4, layer, objPick);
}
playerMove = true;