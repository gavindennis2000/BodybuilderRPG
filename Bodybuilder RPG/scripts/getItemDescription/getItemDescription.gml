function getItemDescription(name){
	// returns a description of an inventory item

	/*gmlive*/ if (TEST) { if (live_call(name)) return live_result; }

	switch (name) {
		case "Choc. Milk":
			return "Replenishes 200 hp. Central Prairie's flagship drink.";
		default:
			return "No item description available.";	
	}

}