function debug(str, obj = object_index){
	// enhanced show debug message
	var objName = object_get_name(obj);
	show_debug_message($"{objName}: {str}");
}