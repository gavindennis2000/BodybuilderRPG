/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// set all the font stuff
fontX(fa_center);
fontY(fa_middle);
draw_set_font(fontMenu);

// draw the game name
draw_text_border(room_width/2, room_height/2 - 64, "Bodybuilder RPG\n(Menu work in progress)", c_white, 1);

// draw the menus
var textX = room_width/2, textY = room_height/2;
switch (screen) {
    case "menu":
        var str;
        draw_text_border(textX, textY - 8, "New Game", getColor("new game"), 1);
        draw_text_border(textX, textY + 8, "Continue", getColor("continue"), 1);
        break;
    case "new game":
        
        break;
}