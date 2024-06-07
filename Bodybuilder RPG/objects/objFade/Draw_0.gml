if (parent != -1) { fadeRoom = parent.fadeRoom; }
var temp = draw_get_alpha();
draw_set_alpha(fadeRoom)
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(temp);