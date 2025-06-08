// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getPictureIndex(name){
	switch (name) {
		case "andro":
		case "ana":
		case "doms":
			return 1;
			break;
		case "monologue":
		default:
			return -1;
			break;
	}
}