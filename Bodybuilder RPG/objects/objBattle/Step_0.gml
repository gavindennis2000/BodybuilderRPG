// objBattle step

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

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
        marquee.counter = 1;
        marquee.text = $"{string_upper(enemySelected.battleID)}  {enemySelected.stats.hp} / {enemySelected.stats.maxhp}";
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

if (state != "ready")
    exit;

// confirm
if (confirm) {
    // debug(selections[selection]);
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
    }
    else if (focus == "players") {
        if (screen == "Run Away") {
            debug("running away!");
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
}
else if (cancel)
    playSound(sndError);

// directions
else if (focus == "menu") {
    if (left) {
        playSound(sndCursor);
        if (selection == 1 || selection == 3)
            selection --;
        else 
            selection ++;
    }
    else if (right) {
        playSound(sndCursor);
        if (selection == 0 || selection == 2)
            selection++;
        else
            selection--;
    }
    else if (down) {
        playSound(sndCursor);
        if (selection == 0 || selection == 1)
            selection += 2;
        else 
            selection -= 2;
    }
    else if (up) {
        playSound(sndCursor);
        if (selection == 2 || selection == 3) {
            selection -= 2;
        }
        else 
            selection += 2;
    }

    // check to make sure cursor isn't out of bounds
    if (selection > 3)
        selection -= 4;
    else if (selection < 0)
        selection += 4;
}
else if (focus == "enemies") {
    if (up && array_length(myEnemies) > 0) {
        playSound(sndCursor);
        selection--;
        if (selection < 0)
            selection = array_length(myEnemies) - 1;
    }
    else if (down && array_length(myEnemies) > 0) {
        playSound(sndCursor);
        selection++;
        if (selection >= array_length(myEnemies))
            selection = 0;
    }
}