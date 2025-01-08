function initiateBattle(special = false, song = sndBattle) {
    // initiates battle during overworld
    
    // random encounters only happen in the overworld
    // unless there is a special condition
    if (room != rOverworld && !special ) { exit; }
        
    // update the global statuses
    global.battle = true;
    global.playerX = objPlayer.x; 
    global.playerY = objPlayer.y;
    global.returnRoom = room;
    
    // play the battle music
    if (instance_exists(objMusic)) {
        with (objMusic) {
            audio_pause_sound(soundID);
            audio_play_sound(sndStartBattle, 1, false, 1);
            global.battleSong = audio_play_sound(song, 1, true, 1);
        }
    }
    
    var camX = camera_get_view_x(view_camera[0]);
    var camY = camera_get_view_y(view_camera[0]);

    // decide on an enemy
    var enemy = [ global.enemies.gymbro ];
    if (global.chapter == 1) {
        enemy = [
            global.enemies.dyel,
            global.enemies.dyel,
            global.enemies.gymbro,
            global.enemies.gymbro,
            global.enemies.strongman,
        ];
        if (global.statsMin[1] >= 20) {
            array_push(enemy, global.enemies.stoiclifter);
            array_push(enemy, global.enemies.stoiclifter);
        }
        else debug("not strong enough for stoic")
    }
    // randomly pick enemy from the array
        var rand = irandom(array_length(enemy)-1);
        instance_create_layer(camX + 240, camY + 135, "Instances", objBattle, {
            enemyToCopy: enemy[rand]
        });
}

function debug(str1, str2="", str3="", str4="") {
    var str = string_concat(str1, str2, str3, str4);
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