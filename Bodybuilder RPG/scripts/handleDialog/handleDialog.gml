function handleDialog(npcID = -1, itemID = -1){
	// finds the right dialog for npc/item
	
	switch(global.chapter) {
		case 2:
			break;
		case 3:
			break;
		case 1:
		default:
			ch1Dialog(npcID, itemID);
			break;
	}
	
	return;
}