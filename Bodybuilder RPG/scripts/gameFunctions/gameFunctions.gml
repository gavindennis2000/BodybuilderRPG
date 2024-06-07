function gymbagSort() {
	
	// delete empty items
	for (i = 0; i < array_length(global.gymbag); i++) {
		if (global.gymbag[i][1] == 0) {
			array_delete(global.gymbag, i, 1);
		}
	}
	
}