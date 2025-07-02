// objBattle step

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (state == "victory" || state == "loss")
    exit;

// get the current fighter's skillset
var turnID = (turn != -1) ? turn.battleID : -1;
switch (turnID) {
    case "andro":
        skills = global.skills.andro;
        break;    
    case "ana":
        skills = global.skills.ana;
        break;    
    case "doms":
        skills = global.skills.doms;
        break;    
    default:
        break;
}

// get the inventory
inventory = [
    array_length(global.inventory) >= inventoryCursor + 1 ? global.inventory[inventoryCursor + 0] : -1,
    array_length(global.inventory) >= inventoryCursor + 2 ? global.inventory[inventoryCursor + 1] : -1,
    array_length(global.inventory) >= inventoryCursor + 3 ? global.inventory[inventoryCursor + 2] : -1,
    array_length(global.inventory) >= inventoryCursor + 4 ? global.inventory[inventoryCursor + 3] : -1,
];

// configure the selections
switch (screen) {
    case "main":
        focus = "menu";
        selections = ["Attack", "Skill", "Gym Bag", "Run Away"];
        break;
    case "Attack":
        focus = "enemies";
        selections = myEnemies;
        var enemySelected = selections[selection];
        if (state == "ready") {
            marquee.counter = 1;
            marquee.text = $"{string_upper(enemySelected.battleID)}  {enemySelected.stats.hp} / {enemySelected.stats.maxhp}";
        }
        break;
    case "Skill":
        focus = "menu";
        selections = skills;
        break;
    case "Gym Bag":
        focus = "menu";
        selections = inventory;
        marquee.counter = 1;
        marquee.text = getItemDescription(selections[selection].name);
        break;
    case "Run Away":
        focus = "players";
        selections = myParty;
        selection = "all";
        marquee.counter = 1;
        marquee.text = "Run away from the fight."
        break;
}

var left = input_check_pressed("left");
var right = input_check_pressed("right");
var up = input_check_pressed("up");
var down = input_check_pressed("down");
var confirm = input_check_pressed("south");
var cancel = input_check_pressed("east");

if (state == "enemy turn") {
    state = "wait";
    handleEnemyTurn();
}
if (state != "ready" || optionsOffset > 1)
    exit;

// confirm
if (confirm) {
    if (
        is_numeric(selection) && (
        selections[selection] == "Skill" && array_length(skills) == 0 || 
        selections[selection] == "Gym Bag" && array_length(inventory) == 0 ||
        selections[selection] == "Run Away" && !canRun
    )) {
        playSound(sndError);
    }
    else {
        playSound(sndCursor);
        array_insert(previousSelections, array_length(previousSelections), {
            screen: screen,
            focus: focus, 
            selections: selections, 
            selection: selection
        });
        if (focus == "menu") {
            screen = selections[selection];
            selection = 0;
            if (screen == "Gym Bag") {
                // update the prediction queue
                predictQueue = setPredictQueue(battleQueue, "Item");
            }
        }
        else if (focus == "players") {
            if (screen == "Run Away") {
                screen = -1;
                selection = -1;
                state = "run away";
                with (objBattleInst) {
                    if (side == "party")
                        runAway();
                }
                // fade the music
                alarm_set(1, 30);
            }
        }
        else if (focus == "enemies") {
            if (screen == "Attack") {
                var attacker = turn;
                var enemyToAttack = selections[selection];
                handlePlayerTurn(attacker, enemyToAttack, "Attack");
            }
        }
    }
}

// cancel
else if (cancel && array_length(previousSelections) > 0) {
    // pop the stack to get the previous selections
    playSound(sndCancel);
    selections = array_last(previousSelections).selections;
    selection = array_last(previousSelections).selection;
    focus = array_last(previousSelections).focus;
    screen = array_last(previousSelections).screen;
    array_delete(previousSelections, array_length(previousSelections) - 1, 1);
    // if player is back to the main screen, reset the prediction queue
    if (screen == "main") {
        predictQueue = setPredictQueue(battleQueue);
    }
}
else if (cancel)
    playSound(sndError);

// directions
else if (focus == "menu") {
    if (left) {
        if ((selection == 1 || selection == 3) && selections[selection - 1] != -1) {
            playSound(sndCursor);
            selection--;
        }
    }
    else if (right) {
        if ((selection == 0 || selection == 2) && selections[selection + 1] != -1) {
            playSound(sndCursor);
            selection++;
        }
    }
    else if (down) {
        if ((selection == 0 || selection == 1) && selections[selection + 2] != -1) {
            playSound(sndCursor);
            selection += 2;
        }
    }
    else if (up) {
        if ((selection == 2 || selection == 3) && selections[selection - 2] != -1) {
            playSound(sndCursor);
            selection -= 2;
        }
    }

    // check to make sure cursor isn't out of bounds
    if (selection > 3)
        selection -= 4;
    else if (selection < 0)
        selection += 4;
}

else if (focus == "enemies") {
    if (up && array_length(myEnemies) > 1) {
        playSound(sndCursor);
        selection--;
        if (selection < 0)
            selection = array_length(myEnemies) - 1;
    }
    else if (down && array_length(myEnemies) > 1) {
        playSound(sndCursor);
        selection++;
        if (selection >= array_length(myEnemies))
            selection = 0;
    }
}