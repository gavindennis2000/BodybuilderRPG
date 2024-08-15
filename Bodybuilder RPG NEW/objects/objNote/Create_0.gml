switch(x) {
	case 480 - 32*6:
		image_index = 0;
		break;
	case 480 - 32*5:
		image_index = 1;
		break;
	case 480 - 32*4:
		image_index = 2;
		break;
	case 480 - 32*3:
		image_index = 3;
		break;
}
image_speed = 0;
depth = layer_get_depth(layer) - 1;
image_alpha = 0.75;