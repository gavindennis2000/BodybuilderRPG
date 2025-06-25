// objBattle create

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// create the instances for party members and enemies
var battleDist = 128;  // distance between player and enemies
var playerDistX = 8;  // horizontal distance between each party member
var playerDistY = 48;  // vertical distance between each party member

// handle the player's skillsets and inventory
skills = [];
inventory = [-1, -1, -1, -1];
inventoryCursor = 0;

// keep track of fighter order
battleQueue = [];
predictQueue = [];

// drawing stuff
optionsOffset = 400;
optionsOffsetStart = optionsOffset;
turn = -1;

// keep track of states and screen information
state = "start";
selection = 0;
focus = "menu";
selections = [];
screen = "main";
previousSelections = [];  // a stack of structs holding the previous selections

// keep track of attack status so that people aren't attacking over each other
attackStatus = {
    ready: false
}

// marquee for sharing important info with player
marquee = {
    text: startText,
    height: 0, 
    heightMax: 16,
    counter: 0
}
alarm[0] = 30;

// the party
global.battleData.party = ["andro", "ana"];
global.battleData.enemies = ["robber"];
party = global.battleData.party;
myParty = [];  // array that holds the fighter instance references
myEnemies = [];  // array that holds the enemy fighter references

// create battle instances for the party and add them to the total fighter pool
var xDist = 24, yDist = 40;
for (var i = 0; i < array_length(party); i++) {
    var fighter = instance_create_depth(CAM_WIDTH * 1 / 4, CAM_HEIGHT / 2 - 16, layer_get_depth(layer_get_id("Instances")) - i, objBattleInst, {
        battleID: party[i],
        side: "party",
        face: "right",
    });

    with (fighter) {
        x -= xDist * i;
        y += yDist * i;

        x += xDist * (array_length(other.party) - 1) / 2;
        y -= yDist * (array_length(other.party) - 1) / 2;

        xstart = x;
        ystart = y;
    }

    // put party member into the myParty array for stat drawing
    array_insert(myParty, array_length(myParty), fighter);

    // put party member into the fighter pool
    array_insert(battleQueue, array_length(battleQueue), {
        ref: fighter,
        battleID: fighter.battleID, 
        side: "party",
        face: "left",
        pos: i + 1,
        counter: 100 - fighter.stats.cardio + 0.1 * i
    });
}

// the enemies
enemies = global.battleData.enemies;

// check whether or not the player can run away
canRun = global.battleData.canRun;

// create battle instances for the enemies and add them to the total fighter pool
for (var i = 0; i < array_length(enemies); i++) {
    var fighter = instance_create_depth(CAM_WIDTH * 3 / 4, CAM_HEIGHT / 2 - 16, layer_get_depth(layer_get_id("Instances")) - i - (array_length(myParty)), objBattleInst, {
        battleID: enemies[i],
        face: "left",
        side: "enemies"
    });

    with (fighter) {
        x += xDist * i;
        y += yDist * i;

        x -= xDist * (array_length(other.enemies) - 1) / 2;
        y -= yDist * (array_length(other.enemies) - 1) / 2;

        xstart = x;
        ystart = y;
    }

    // put enemy member into the myEnemy array for stat drawing
    array_insert(myEnemies, array_length(myEnemies), fighter);

    // add enemy fighters to total fighter pool
    array_insert(battleQueue, array_length(battleQueue), {
        ref: fighter,
        battleID: fighter.battleID, 
        side: "enemies",
        pos: i + 1,
        counter: 100 - fighter.stats.cardio + 0.1 * (i + (array_length(party)))
    });
}

// battle functions in alphabetical order

handleAttack = function(attacker, attacked) {
    // handles attack; either party or enemy
    // attacker -> pointer to battleQueue array index
    // attacked -> pointer to battle instance

    /*gmlive*/ if (TEST) { if (live_call(attacker, attacked)) return live_result; }

    // adjust the attacker's hit counter
    var spdFactor = attacker.ref.stats.cardio;
    attacker.counter += ATTACK_COUNTER - (spdFactor % 5 / 4);;
    // debug($"New attack counter: {attacker.counter}");


    // calculate the damage
    var attackerStr = attacker.ref.stats.strength;
    var attackedDef = attacked.stats.endurance;
    var dmg = round((attackerStr * 10 - attackedDef * 5) * random_range(0.8, 1.2));
    attacked.stats.hp -= dmg;

    // instruct the fighter to animate
    var attackerInst = attacker.ref;
    with (attackerInst) {
        attack(attacked, dmg);
    }

    // let the alarm handle the rest
    state = "attacking";
    turn = -1;
    attackStatus.ready = false;
    alarm_set(0, 1);

    return;
}

handleEnemyTurn = function() {
    // does what it says

    /*gmlive*/ if (TEST) { if (live_call(battleQueue)) return live_result; }

    // get the enemy's move and the attack target
    var enemy = turn.ref;
    var move = enemy.moves[enemy.moveIndex];
    var target = myParty[irandom(array_length(myParty) - 1)];

    with (enemy) {
        moveIndex++;
        if (moveIndex >= array_length(moves))
            moveIndex = 0;
    }

    switch (move) {
        case "Attack":
            // debug($"{turn.battleID} attacks {target}.");
            handleAttack(turn, target);
            break;    
    }

    return;
}

getNextTurn = function(battleQueue) {
    // pops battle queue and returns the front

    /*gmlive*/ if (TEST) { if (live_call(battleQueue)) return live_result; }

    var nextFighter = array_first(battleQueue);
    // debug($"Next fighter is {nextFighter.battleID} new array: {battleQueue}");

    return nextFighter;
}

sortBattleQueue = function(battleQueue) {
    // simple sorting algorithm to determine order of fighters

    /*gmlive*/ if (TEST) { if (live_call(battleQueue)) return live_result; }

    var sortedQueue = battleQueue;

    for (var i = 0; i < array_length(sortedQueue) - 1; i++) {
        for (var j = i + 1; j < array_length(sortedQueue); j++) {
            if (sortedQueue[j].counter < sortedQueue[i].counter) {
                var temp = variable_clone(sortedQueue[i]);
                sortedQueue[i] = sortedQueue[j];
                sortedQueue[j] = temp;
            }
        }
    }

    // debug($"Sorted: {battleQueue}");
    return sortedQueue;
}

setPredictQueue = function(battleQueue, attackType = "Attack") {
    // finds out the predicted battle queue

    var predict = [];
    for (var i = 0; i < array_length(battleQueue); i++) {
        array_insert(predict, array_length(predict), {
            ref: battleQueue[i].ref,
            battleID: battleQueue[i].battleID,
            side: battleQueue[i].side,
            counter: battleQueue[i].counter, 
            pos: battleQueue[i].pos,
            clone: false
        });
    }

    for (var i = 0; i < array_length(predict) - 1; i++) {
        var counterIncrease = 0;
        var spdFactor = predict[i].ref.stats.cardio;
        switch (attackType) {
            case "Attack":
                counterIncrease = ATTACK_COUNTER - (spdFactor % 5 / 4);
                break;    
            case "Item":
                counterIncrease = ITEM_COUNTER - (spdFactor % 5 / 4);
                break;    
        }
        if (predict[i].counter + counterIncrease < predict[i + 1].counter)
            array_insert(predict, i + 1, {
                ref: predict[i].ref,
                battleID: predict[i].battleID, 
                side: predict[i].side, 
                counter: predict[i].counter + counterIncrease, 
                pos: predict[i].pos,
                clone: true
            });
    }

    while (array_length(predict) < 6) {
        for (var i = 0; i < array_length(battleQueue); i++) {
        array_insert(predict, array_length(predict), {
            battleID: battleQueue[i].battleID,
            side: battleQueue[i].side,
            counter: battleQueue[i].counter, 
            pos: battleQueue[i].pos,
            clone: false
        });
    }
    }
    // debug($"\npredict queue {i}: \n{predict[i]}");
    return predict;
}

battleQueue = sortBattleQueue(battleQueue);
predictQueue = setPredictQueue(battleQueue);