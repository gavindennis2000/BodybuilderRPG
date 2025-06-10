function debug(str, obj = object_index){
	// enhanced show debug message

	/*gmlive*/ if (TEST) { if (live_call(str, obj = object_index)) return live_result; }

	var objName = object_get_name(obj);
	var eventNum = event_type;
	var eventStr = "";
	switch (eventNum) {
		case 0:
			eventStr = "create"
			break;
		case 1:
			eventStr = "destroy"
			break;
		case 2:
			eventStr = "alarm";
			break;
		case 3:
			eventStr = "step";
			break;
		case 7:
			eventStr = "other";
			break;
		case 8:
			eventStr = "draw";
			break;
		case 16:
			eventStr = "drawGUI";
			break;
		default:
			eventStr = string(eventNum);
			break;
	}
	show_debug_message($"{objName}-{eventStr} << {str}\n");
}