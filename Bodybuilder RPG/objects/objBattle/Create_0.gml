// objBattle create

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// create the instances for party members and enemies
var battleDist = 128;  // distance between player and enemies
var playerDistX = 8;  // horizontal distance between each party member
var playerDistY = 48;  // vertical distance between each party member

battleQueue = [];
optionsOffset = 400;
optionsOffsetStart = optionsOffset;
turn = -1;
state = "start";
selection = 0;
focus = "menu";
selections = [];
screen = "main";
previousSelections = [];  // a stack of structs holding the previous selections
marquee = {
    text: startText,
    height: 0, 
    heightMax: 16,
    counter: 0
}
alarm[0] = 30;

// the party
global.battleData.party = ["andro", "ana", "doms"];
party = global.battleData.party;
myParty = [];  // array that holds the fighter instance references
myEnemies = [];  // array that holds the enemy fighter references

// create battle instances for the party and add them to the total fighter pool
var xDist = 24, yDist = 40;
for (var i = 0; i < array_length(party); i++) {
    var fighter = instance_create_layer(CAM_WIDTH * 1 / 4, CAM_HEIGHT / 2 - 16, layer, objBattleInst, {
        battleID: party[i],
        side: "party",
        face: "right",
    });

    with (fighter) {
        x -= xDist * i;
        y += yDist * i;

        x += xDist * (array_length(other.party) - 1) / 2;
        y -= yDist * (array_length(other.party) - 1) / 2;
    }

    // put party member into the myParty array for stat drawing
    array_insert(myParty, array_length(myParty), fighter);

    // put party member into the fighter pool
    array_insert(battleQueue, array_length(battleQueue), {
        battleID: fighter.battleID, 
        side: "party",
        face: "left",
        counter: 100 - fighter.stats.cardio + 0.1 * i
    });
}

// the enemies
global.battleData.enemies = ["robber", "robber"];
enemies = global.battleData.enemies;

// create battle instances for the enemies and add them to the total fighter pool
for (var i = 0; i < array_length(enemies); i++) {
    var fighter = instance_create_layer(CAM_WIDTH * 3 / 4, CAM_HEIGHT / 2 - 16, layer, objBattleInst, {
        battleID: enemies[i],
        side: "enemies"
    });

    with (fighter) {
        x += xDist * i;
        y += yDist * i;

        x -= xDist * (array_length(other.enemies) - 1) / 2;
        y -= yDist * (array_length(other.enemies) - 1) / 2;
    }

    // put party member into the myParty array for stat drawing
    array_insert(myEnemies, array_length(myEnemies), fighter);

    // add enemy fighters to total fighter pool
    array_insert(battleQueue, array_length(battleQueue), {
        battleID: fighter.battleID, 
        side: "enemies",
        pos: i + 1,
        counter: 100 - fighter.stats.cardio + 0.1 * (i + (array_length(party)))
    });
}

getNextTurn = function(battleQueue) {
    // pops battle queue and returns the front

    /*gmlive*/ if (TEST) { if (live_call(battleQueue)) return live_result; }

    var nextFighter = array_first(battleQueue);
    array_delete(battleQueue, 0, 1);
    debug($"Next fighter is {nextFighter} new array: {battleQueue}");

    return nextFighter;
}
sortBattleQueue = function(battleQueue) {
    // simple sorting algorithm to determine order of fighters

    /*gmlive*/ if (TEST) { if (live_call(battleQueue)) return live_result; }

    for (var i = 0; i < array_length(battleQueue) - 1; i++) {
        for (var j = i + 1; j < array_length(battleQueue); j++) {
            if (battleQueue[j].counter < battleQueue[i].counter) {
                var temp = variable_clone(battleQueue[i]);
                battleQueue[i] = battleQueue[j];
                battleQueue[j] = temp;
            }
        }
    }

    debug($"Sorted: {battleQueue}");
    return;
}

sortBattleQueue(battleQueue);