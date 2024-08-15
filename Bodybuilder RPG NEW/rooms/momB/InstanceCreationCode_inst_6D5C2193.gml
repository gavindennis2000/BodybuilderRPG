switch(global.chapter) {
	
	case 0:
		text = [
			["Bench press. My favorite Lift!","Maybe I'll knock out a few sets after work..."],
			["Maybe I'll knock out a few sets after work..."]
		];
		break;
		
	case 1:
		text = [
			["Bench press. My favorite Lift!","I think I have time for a couple sets...","Time to bench?"]
		];
		prompt = ["Yes","No",1];
		break;

}
textIndexMax = array_length(text)-1;