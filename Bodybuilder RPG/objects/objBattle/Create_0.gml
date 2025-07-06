// objBattle create

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// handle test battles

// create the instances for party members and enemies
var battleDist = 128;  // distance between player and enemies
var playerDistX = 8;  // horizontal distance between each party member
var playerDistY = 48;  // vertical distance between each party member

// handle the player's skillsets and inventory
skills = [];
inventory = [-1, -1, -1, -1];
inventoryCursor = 0;
queuedItem = -1;  // next used item

// keep track of fighter order
battleQueue = [];
predictQueue = [];

// drawing stuff
optionsOffset = 400;
optionsOffsetStart = optionsOffset;
turn = -1;
fadeBlack = -1;

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
        counter: 100 - fighter.stats.cardio + 0.001 * i
    });
}

// the enemies
enemies = global.battleData.enemies;

// check whether or not the player can nun away
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
        counter: 100 - fighter.stats.cardio + 0.001 * (i + (array_length(party)))
    });
}

// show the xp bar after victory
xpAccumulated = 0;
victoryBarX = -1;
victoryBarXFinal = CAM_WIDTH / 2;
victoryBarXP = 0;

// battle functions in alphabetical order

battleOver = function(status) {
    // the battle is finished

    /*gmlive*/ if (TEST) { if (live_call(status)) return live_result; }

    state = status;
    turn = -1;
    debug(state);
    var aTime = 105;
    if (state == "victory") {
        audio_sound_gain(global.battleMusic, 0, aTime / 6 * 100)
        alarm_set(3, aTime);
    }
    else if (state == "loss") {
        with (objMusic)
            death();
        alarm_set(2, 10);
    }
}

checkFighterHP = function() {
    // checks to see if any fighters are dead after an attack

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    var playerStillAlive = false;  // make sure at least one player is alive        
    for (var i = 0; i < array_length(battleQueue); i++) {
        if (battleQueue[i].ref.stats.hp <= 0) {
            if (battleQueue[i].side == "enemies") {
                for (var j = 0; j < array_length(myEnemies); j++) {
                    if (myEnemies[j] == battleQueue[i].ref) {
                        xpAccumulated += battleQueue[i].ref.stats.xp;
                        array_delete(myEnemies, j, 1);
                    }
                    if (array_length(myEnemies) == 0) {
                        // the battle is won
                        battleOver("victory");
                        break;
                    }
                }
            }
            // debug($"removed {battleQueue[i].battleID} from queue")
            array_delete(battleQueue, i, 1);
            i--;
        }
        else if (battleQueue[i].side == "party")
            playerStillAlive = true;
    }

    if (!playerStillAlive)
        battleOver("loss");
    return;
}

getSpeedFactor = function(cardio) {
    // uses cardio to calculate speed factor

    /*gmlive*/ if (TEST) { if (live_call(cardio)) return live_result; }

    var spdFactor = ((cardio div 5) / 2);

    return spdFactor;
}

handleAttack = function(attacker, attacked) {
    // handles attack; either party or enemy
    // attacker -> pointer to battleQueue array index
    // attacked -> pointer to battle instance

    /*gmlive*/ if (TEST) { if (live_call(attacker, attacked)) return live_result; }

    // calculate the damage
    var attackerStr = attacker.ref.stats.strength;
    var attackedDef = attacked.stats.endurance;
    var dmg = round((attackerStr * 10 - attackedDef * 5) * random_range(0.95, 1.05));
    if (dmg < 1)
        dmg = 1;
    else if (dmg > 999)
        dmg = 999;

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

handleItem = function(attacker, attacked) {
    // handles item use; either party or enemy
    // attacker -> pointer to battleQueue array index
    // attacked -> pointer to battle instance

    /*gmlive*/ if (TEST) { if (live_call(attacker, attacked)) return live_result; }

    // instruct the fighter to animate
    var attackerInst = attacker.ref;
    with (attackerInst) {
        useItem(attacked, other.queuedItem);
    }

    // let the alarm handle the rest
    state = "attacking";
    turn = -1;
    queuedItem = -1;
    attackStatus.ready = false;
    alarm_set(0, 1);

    return;

}

handlePlayerTurn = function(attacker, attacked, move) {
    // does what it says

    /*gmlive*/ if (TEST) { if (live_call(attacker, attacked, move)) return live_result; }

    var cardio = attacker.ref.stats.cardio;
    var spdFactor = getSpeedFactor(cardio);
    // debug($"cardio: {cardio} spdfactor {spdFactor}");
            // adjust the attacker's hit counter
    switch (move) {
        case "Attack":
            attacker.counter += ATTACK_COUNTER - spdFactor;
            handleAttack(attacker, attacked);
            break;
        case "Item":
            attacker.counter += (ATTACK_COUNTER - spdFactor) / 2;
            handleItem(attacker, attacked);
            break;
    }
    return;
}

handleEnemyTurn = function() {
    // does what it says

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    // get the enemy's move and the attack target
    var enemy = turn.ref;
    var move = enemy.moves[enemy.moveIndex];
    var target = myParty[irandom(array_length(myParty) - 1)];
    while (target.state == "ko")
        target = myParty[irandom(array_length(myParty) - 1)];
    
    // adjust the enemy's tick counter
    var cardio = enemy.stats.cardio;
    var spdFactor = getSpeedFactor(cardio);
    // debug (spdFactor);
    turn.counter += ATTACK_COUNTER - spdFactor;
    
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

    return array_first(battleQueue);
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

    // copy the battle queue
    var predict = [];
    for (var i = 0; i < array_length(battleQueue); i++) {
        array_insert(predict, array_length(predict), {
            ref: battleQueue[i].ref,
            battleID: battleQueue[i].battleID,
            side: battleQueue[i].side,
            counter: battleQueue[i].counter, 
            pos: battleQueue[i].pos,
        });
    }

    // create clones of each fighter
    var originalLength = array_length(predict);
    for (var i = 0; i < originalLength; i++) {
        var cardio = predict[i].ref.stats.cardio;
        var spdFactor = getSpeedFactor(cardio);
        var counterIncrease
        var originalIncrease = ATTACK_COUNTER - spdFactor;;
        switch (attackType) {
            case "Item":
                counterIncrease = originalIncrease / 2;
                break;    
            case "Attack":
            default:
                counterIncrease = originalIncrease
                break;    
        }
        for (var j = 0; (i == 0) ? j < 4 : j < 3; j++) {
            var clone = (j == 0) ? variable_clone(predict[i]) : variable_clone(predict[array_length(predict) - 1]);
            clone.counter += (i == 0 && j == 0) ? counterIncrease : originalIncrease;
            array_insert(predict, array_length(predict), clone);
        }
    }

    // sort the array with the clones
    for (var i = 0; i < array_length(predict) - 1; i++) {
        for (var j = i + 1; j < array_length(predict); j++) {
            if (predict[j].counter < predict[i].counter) {
                var temp = variable_clone(predict[i]);
                predict[i] = predict[j];
                predict[j] = temp;
            }
        }
        // debug($"predict {i}: {predict[i]}");
    }

    for (var i = 0; i < array_length(predict); i++)
    // debug ($"fighter: {predict[i].battleID} {predict[i].pos} counter: {predict[i].counter}");
    return predict;

    // for (var i = 0; i < array_length(predict) - 1; i++) {
    //     var cardio = predict[i].ref.stats.cardio;
    //     var spdFactor = ((cardio div 5) / 2);
    //     var counterIncrease;
    //     
    //     var clone = variable_clone(predict[i]);
    //     clone.counter += counterIncrease;
    //     for (var j = i + 1; j < array_length(predict); j++) {
    //         if (clone.counter < predict[j].counter) {
    //             array_insert(predict, j, clone);
    //             clone.counter += ATTACK_COUNTER - spdFactor;
    //         }
    //     }
    //     if (array_length(predict) >= 10)
    //         return predict;
    // }

    // var repeatIndex = 0;
    // while (array_length(predict) < 5) {
    //     array_insert(predict, array_length(predict), predict[repeatIndex++]);
    // }
    return predict;
}

battleQueue = sortBattleQueue(battleQueue);
predictQueue = setPredictQueue(battleQueue);