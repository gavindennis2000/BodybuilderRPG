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

// show details
if (keyboard_check_pressed(ord("Q")))
    global.showDetails = !global.showDetails;

// sample textbox
if (keyboard_check_pressed(ord("T"))) {
    if (oPlayer.canCertainlyMove) {
        oPlayer.canMove = false;
        var sample = [
            {
                name: "Andro",
                text: "this is my first text",
                action: function() {
                    debug("did this work?", -1);
                }
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
                text: "and a name",
                action: function() {
                    debug("this is the last one", -1)
                }
            }
        ];
        textbox(sample);
    }
}

// test battle
if (keyboard_check_pressed(ord("B"))) {
    global.battle.party = ["andro"];
    global.battle.enemies = ["npc"];
    oBattle.startBattle();
}