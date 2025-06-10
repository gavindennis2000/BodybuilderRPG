function debug(str, obj = object_index){
	// enhanced show debug message

	/*gmlive*/ if (TEST) { if (live_call(str, obj = object_index)) return live_result; }

	var objName = object_get_name(obj);
	show_debug_message($"{objName} {string(event_type)}: {str}");
}