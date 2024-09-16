function draw_text_border(x, y, string, color, alpha, border = c_black) {
	var c = border;
	draw_text_color(x+1, y+1, string, c, c, c, c, alpha);
	draw_text_color(x, y, string, color, color, color, color, alpha);	
}

function fontX(halign) {
	draw_set_halign(halign);
}

function fontY(valign) {
	draw_set_valign(valign);
}

function save_game() {
	
}

function load_game() {
	
}

function string_replace_at(str, n, insert) {
	if (string_length(str)>=n) {
    
	    var tempString = "";
	    tempString = string_insert(insert,str,n);
	    tempString = string_delete(tempString,n+1,1);
	    return tempString;
    
	}
	else {
    
	    return str;
    
	}	
}