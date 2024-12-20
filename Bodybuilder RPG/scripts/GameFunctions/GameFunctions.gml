
function debug(str1, str2="", str3="", str4="") {
    str = string_concat(str1, str2, str3, str4);
    show_debug_message(str);
}

function drawScore(x, y, str) {
    var d = 3;
    draw_text_color(x + 1, y + d, str, c_black, c_black, c_black, c_black, 1);
    draw_text_color(x, y, str, c_white, c_white, c_white, c_white, 1);	
}

function drawScoreAlpha(x, y, str, alpha) {
    var d = 3;
    draw_text_color(x + 1, y + d, str, c_black, c_black, c_black, c_black, alpha);
    draw_text_color(x, y, str, c_white, c_white, c_white, c_white, alpha);	
}

function drawScoreExt(x, y, str, xscale, yscale) {
    var d = 3;
    draw_text_transformed_color(x + 1, y + d, str, xscale, yscale, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_color(x, y, str, xscale, yscale, 0, c_white, c_white, c_white, c_white, 1);
}

function levelUp(stat1 = 1, stat2 = 1) {
    stat1++;
    stat2++;
    playSound(sndLevelUp);
    levelUpY = room_height;
    levelUpAlpha = 1;
}

function draw_text_border(x, y, string, color, alpha = 1, border = c_black) {
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

function setFont(font) {
    draw_set_font(font);
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