/*gmlive*/if (TEST) { if (live_call()) return live_result; }
    
layer = layer_create(-1000, "battle");
camAngle = real(camera_get_view_angle(view_camera[0]));
whiteIncrease = 0;
fadeWhite = 0;
fadeBlack = 0;
initialX = camera_get_view_x(view_camera[0]);
initialY = camera_get_view_y(view_camera[0]);
aCounter = 0;  // counter for alarm attacks
// the player
player = {
    spr: sprPlayerUp,
    imgSpd: 0,
    x: 240 - 32,
    y: 135 - 32 + 30,
}
// the enemy
if (!variable_instance_exists(self, "enemy")) {
    enemy = {
        name: "DYEL",
        spr: sprPlayerDown,
        imgSpd: 0,
        x: 240 - 32,
        y: 135 - 32 - 30,
        attacks: [
            {
                name: "Attack",  // the name of the attack
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            }
        ],
        attackIndex: 0,
        health: 20,
        strength: 5
    }
}
pStart = player.x;
pFinalX = player.x;
pFinalY = player.y;
ready = false;
menuX = 0;

selection = "attack";
screen = "menu";

inventory = global.inventory;
attacks = global.attacks;  // attacks are static
skills = [];

// delete skills that the player doesn't have yet
for (var i = 0; i < array_length(global.skills); i++) {
    if (global.skills[i].unlocked) {
        debug("added to array");
        array_push(skills, global.skills[i]);
    }
}

// battle variables
sCursor = 0;  // selection cursor
turn = "player";  // whose turn is it?
escape = false;  // boolean that flags when the player runs away

function getColor(select) {
    // finds the correct color for menu options
    
    if TEST { if (live_call(select)) return live_result; }
    
    // attacks, skills, and items
    if (is_struct(select)) {
        if (select.name == selection.name)
            return #cccc00;
    }
    var str = string(select)
    var color = c_white;
    if (str == selection)
        color = #cccc00;  // darkish yellow

    if (select == "item" && array_length(global.inventory) == 0) { color = c_gray; }
    return color;
}

function move(m) {
    if TEST { if (live_call(m)) return live_result; }
    // the player's move

    aCounter = 0;  // reset aCounter

    switch (m) {
        case attacks[0]:
            // overhead press
            alarm[1] = 1;
            turn = "attack";
            break;
        case attacks[1]:
            // pulldown
            alarm[1] = 1;
            turn = "attack";
            break;
        case attacks[2]:
            // leg press
            alarm[1] = 1;
            turn = "attack";
            break;
        case "Scan":
            // scan the enemy for data
            var eName = string_lower(enemy.name);
            var stats = $"Stats: \{ Health: {enemy.health}, Strength: {enemy.strength} } `Next Attack: { enemy.attacks[enemy.attackIndex].name }";
            
            // get the enemy's description
            var desc = "" 
            switch (eName) {
                case "dyel":
                    desc = "DYEL: A powerlifter with ~5 years experience that `doesn't even look like he lifts.";
                    break;
            }

            // create the textbox
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    string_concat(global.characterName, " scans the enemy!"),
                    desc,  // the enemy's name and description
                    stats  // the enemy's health and strength
                ],
            });

            // sound effect
            playSound(sndUseSkill);
            
            // set the alarm and stuff
            turn = "attack";
            selection = "Scan";
            alarm[1] = 30;
            break;
        case "item":
             // use the item
             var txt = "";
             txt = objController.useItem(selection.name);

            // sound effect
            playSound(sndUseItem);

            // create the textbox
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    string_concat(global.characterName, " uses ", selection.name, "."),
                    txt
                ],
            });

            // set the alarm and stuff
            turn = "attack";
            selection = "Item";
            alarm[1] = 30;
            break;
        case "escape":
            turn = "escape";
            goBack();
            break;
    }
}

function enemyTurn() {
    if TEST { if (live_call()) return live_result; }

    // handle the enemy's turn
    debug("enemy turn");
    
    // end the enemy's turn
    endEnemyTurn();
}

function endEnemyTurn() {
    // resets everything for the player's turn

    if TEST { if (live_call()) return live_result; }
    
    menuX = 480;
    screen = "menu";
    sCursor = 0;
    selection = "attack";
    turn = "player";
}

function goBack() {
    // goes back to previous room

    alarm[0] = 1;
    audio_sound_gain(global.battleSong, 0, 1000);
}