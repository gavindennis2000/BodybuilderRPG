// developer tools for keyboard
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!TEST)
    exit;

// restart room
if (keyboard_check_pressed(ord("R"))) {
    if (instance_exists(oPlayer))
        global.playerSpawn = {
            spawn: true,
            pX: oPlayer.x, 
            pY: oPlayer.y, 
            pFace: oPlayer.face,
        }
    room_restart();
}

// restart game
if (keyboard_check_pressed(ord("G")))
    game_restart();

// sample textbox
if (keyboard_check_pressed(ord("T"))) {
    if (oPlayer.canCertainlyMove) {
        oPlayer.canMove = false;
        var sample = [
            {
                name: "Andro",
                text: "this is my first text"
            },
            {
                text: "this is my second text"
            },
            "this is my third.",
            "this is my fourth.",
            {
                name: "",
                text: "no name",
                prompt: [
                    "No way!",
                    function() {
                        playSound(sndUseSkill);
                    },
                    "Let's do it....",
                    function() {
                        playSound(sndLevelUp);
                    }
                ],
            },
            "no name again",
            {
                name: "name",
                text: "and a name"
            }
        ];
        textbox(sample);
    }
}