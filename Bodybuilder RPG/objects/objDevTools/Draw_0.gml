if (TEST) {
	fontX(fa_left);
	fontY(fa_top);
	draw_text_border(
		camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 
		string_concat("devtools\n","no encounters: ", string(global.noEncounters)),
		c_aqua, 0.3
	);
}