// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getPictureIndex(name){
	// returns index of talker's portrait

	/*gmlive*/ if (TEST) { if (live_call(name)) return live_result; }
	
	switch (name) {
		case "andro":
			return 0;
		case "ana":
			return 5;
		case "jim":
			return 25;
		case "mom":
			return 20;
		case "doms":
			return 10;
		case "samson":
			return 15;
		default:
			return -1;
			break;
	}
}