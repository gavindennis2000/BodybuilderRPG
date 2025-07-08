function handleDialog(npcID = -1, itemID = -1){
	// finds the right dialog for npc/item
	
	// item dialog
	if (itemID != -1) {
		itemDialog(itemID);
		return;
	}

	// npc dialog
	switch(global.chapter) {
		case 2:
			break;
		case 3:
			break;
		case 1:
		default:
			ch1Dialog(npcID);
			break;
	}
	
	return;
}