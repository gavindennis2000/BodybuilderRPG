/*gmlive*/if (TEST) { if (live_call()) return live_result; }
    
layer = layer_create(-1000, "battle");
camAngle = real(camera_get_view_angle(view_camera[0]));
whiteIncrease = 0;
fadeWhite = 0;
fadeBlack = 0;
initialX = camera_get_view_x(view_camera[0]);
initialY = camera_get_view_y(view_camera[0]);

player = {
    spr: sprPlayerUp,
    x: 240 - 32,
    y: 135 - 32 + 30,
}

if (!variable_instance_exists(self, "enemy")) {
    enemy = {
        name: "DYEL",
        spr: sprPlayerDown,
        x: 240 - 32,
        y: 135 - 32 - 30,
        skills: [
            {

            }
        ],
    }
}
pStart = player.x;
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
    // attacks, skills, and items
    if (is_struct(select)) {
        if (select.name == selection.name)
            return #cccc00;
    }
    var str = string(select)
    var color = c_white;
    if (str == selection)
        color = #cccc00;  // darkish yellow
    return color;
}

function move(m) {
    // the player's move

    switch (m) {
        case "escape":
            //objMusic.endbattle();
            escape = true;
            turn = "escape";
            goBack();
            break;
    }
}

function goBack() {
    // goes back to previous room

    alarm[0] = 1;
    audio_sound_gain(global.battleSong, 0, 1000);
}