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
    hair: sprHairUp,
    imgSpd: 0,
    x: 240 - 32,
    y: 135 - 32 + 30,
}

// the enemy
if (!variable_instance_exists(self, "enemyToCopy")) {
    enemyToCopy = global.enemies.dyel;
}
enemy = {
     // drawing info
     name: enemyToCopy.name,
     spr: enemyToCopy.spr,
     npcImg: 0,
     imgSpd: enemyToCopy.imgSpd,
     x: enemyToCopy.x,
     y: enemyToCopy.y,

     // scan description
     description: enemyToCopy.description,

     // attacks
     attacks: enemyToCopy.attacks,
     attackIndex: enemyToCopy.attackIndex,

     // health
     hp: enemyToCopy.hp,

     // attack power
     strength: enemyToCopy.strength,

     // defense/vulnerabilities
     pushDef: enemyToCopy.pushDef,
     pullDef: enemyToCopy.pullDef,
     legDef: enemyToCopy.legDef,
};

enemy.maxHp = enemy.hp;
pStart = player.x;
pFinalX = player.x;
pFinalY = player.y;
ready = false;
menuX = 0;

// stuff for drawing the bars
drawFatigue = global.stats.fatigue;
drawEHealth = (enemy.hp / enemy.maxHp) * 100;
drawUltimate = global.stats.ultimate;

// menu stuff
selection = "attack";
screen = "menu";

// player options
inventory = global.inventory;
attacks = global.attacks;  // attacks are static
skills = [];

// delete skills that the player doesn't have yet
for (var i = 0; i < array_length(global.skills); i++) {
    if (global.skills[i].unlocked) {
        array_push(skills, global.skills[i]);
    }
}

// decide who goes first (it's usually the player)
turn = "player";
if (enemy.name == "STOIC LIFTER") { 
    turn = "enemy first";
}

// battle variables
sCursor = 0;  // selection cursor
escape = false;  // boolean that flags when the player runs away
enemyDamage = 0;  // damage drawn when the player attacks
enemyDamageY = -1;  // where to draw enemy damage on screen
playerDamage = 0;  // damage drawn when the player is attacked
playerDamageY = -1;  // where to draw enemy damage on screen
deadY = -1;  // height of the drawn sprite for dead people
canScan = true;  // player can scan once without losing a turn
textBuffer = "";  // holds text for later stuff
sfxBuffer = -1;  // holds sound effect for later stuff
enemyItem = -1;  // holds item that enemy uses

// effects and stuff
// flash white when using skills
pSkillAlpha = 1;
pSkillColor = c_white;
eSkillAlpha = 1;
eSkillColor = c_white;
ultimateAlpha = 0

// projectile
projectile = {
    draw: false,
    spr: sprItems,
    sprNum: -1,
    imgIndex: 0,
    x: enemy.x,
    y: enemy.y,
    spd: 8
}
// screen shake
shakeValue = 0;

function calculateDamage(muscleGroup, coefficient = 0) {
    // calculates damage based on muscle group
    // and enemy's strengths/weaknesses

    /*gmlive*/if (TEST) { if (live_call(muscleGroup)) return live_result; }

    var dmg = 0;
    var rand = random_range(0.8, 1.2);

    switch (muscleGroup) {
        case "push":
            // push attack is equal to chest + shoulder strength
            dmg = (global.stats.chest + global.stats.shoulders);
            // calculate enemy's defense
            dmg /= enemy.pushDef;
            break;
        case "pull":
            // pull attack is equal to back + arm strength
            dmg = (global.stats.back + global.stats.arms);
            // calculate enemy's defense
            dmg /= enemy.pullDef;
            break;
        case "legs":
            // push attack is equal to 2x leg strength
            dmg = (global.stats.legs * 2);
            // calculate enemy's defense
            dmg /= enemy.legDef;
            break;
        case "enemy":
            dmg = (enemy.strength * coefficient);
            break;
        }
    return round(dmg * rand);
}

function dead() {
    playSound(sndDeath);
    turn = "win";
    deadY = 0;
    alarm[3] = 60;
}

function endEnemyTurn() {
    // resets everything for the player's turn

    if TEST { if (live_call()) return live_result; }

    // get rid of the projectile
    projectile.draw = false;
    projectile.sprNum = -1;

    // deal the damage to the player
    if (playerDamage != -1) {
        global.stats.fatigue += playerDamage;
        var ultimateIncrease = round(playerDamage * 0.1);
        if (enemy.attacks[enemy.attackIndex].effect == "ultimate") {
            debug("ultimate increased");
            ultimateIncrease *= 3;
        }
        global.stats.ultimate += ultimateIncrease;
        alarm[4] = 1;
    }

    // increment the attack index
    enemy.attackIndex++;
    if (enemy.attackIndex > array_length(enemy.attacks)-1) { enemy.attackIndex = 0; }
    
    // check if player is dead
    if (global.stats.fatigue >= 100) {
        global.stats.fatigue = 100;
        global.stats.ultimate = 0;
        playerDead();
        exit;
    }

    // bring back the player menu and reset everything
    menuX = 480;
    screen = "menu";
    sCursor = 0;
    selection = "attack";
    turn = "player";
}

function enemyMove(m) {
    if TEST { if (live_call(m)) return live_result; }
    // the enemy's move

    aCounter = 0;  // reset aCounter
    playerDamage = -1;  // reset player damage

    // find which attack it is
    var attack = m;
    if (is_struct(m)) {
        attack = m.name;
    }
    switch (attack) {
        case "BCAA":
            // special effects
            playSound(sndUseItem);
            skillFlash("enemy", "item");

            // the textbox with attack name and description
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    m.announcement
                ]
            });

            // set the alarm and stuff
            turn = "attack";
            selection = "enemy item";
            textBuffer = m.description;
            enemyItem = "bcaa";
            alarm[1] = 15;

            break;
        case "Bench Press Blast":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");
            
            // do all the enemy attack stuff
            enemySkill(m);
            
            break;
        case "Charge":
            // the textbox with attack name and description
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    m.description
                ]
            });

            // set the alarm and stuff
            turn = "attack";
            selection = "charge";
            alarm[1] = 15;
            break;
        case "Earbuds":
            // special effects
            playSound(sndUseItem);
            skillFlash("enemy", "item");

            // the textbox with attack name and description
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    m.announcement
                ]
            });

            // set the alarm and stuff
            turn = "attack";
            selection = "enemy item";
            textBuffer = m.description;
            enemyItem = "earbuds";
            alarm[1] = 15;

            break;
        case "Efficient Overhead Press":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");
            
            // do all the enemy attack stuff
            enemySkill(m);
            
            break;
        case "Release":
            // special effects
            playSound(sndUseSkill);
            skillFlash("enemy");

            // projectile
            projectile.x = enemy.x;
            projectile.y = enemy.y;
            projectile.sprNum = 10;
            
            // do all the enemy attack stuff
            enemySkill(m);
            
            break;
        case "Remove Earbuds":
            // special effects
            playSound(sndUseItem);
            skillFlash("enemy", "item");

            // the textbox with attack name and description
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: [
                    m.announcement
                ]
            });

            // set the alarm and stuff
            turn = "attack";
            selection = "enemy item";
            textBuffer = m.description;
            enemyItem = "remove earbuds";
            alarm[1] = 15;

            break;
        case "Rerack":
            // special effects
            playSound(sndUseSkill);
            skillFlash("enemy");

            // projectile
            projectile.x = enemy.x;
            projectile.y = enemy.y;
            projectile.spr = sprNote;
            projectile.imgIndex = irandom(3);
            projectile.sprNum = 0;
            
            // do all the enemy attack stuff
            enemySkill(m);
            
            break;
        case "Skip":
            if (m.effect == "forever") { enemy.attackIndex -= 1; }
            playerDamage = -1;
            endEnemyTurn();
            break;
        case "Sumo Deadlift Smash":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");
            
            // do all the enemy attack stuff
            enemySkill(m);

            break;
        case "Unsolicited Advice":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");
            
            // do all the enemy attack stuff
            enemySkill(m);

            break;
        
        case "Weighted Dip Destruction":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");

            // do all the enemy attack stuff
            enemySkill(m);

            break;
        case "Weighted Pullup Pounce":
            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("enemy");
            
            // do all the enemy attack stuff
            enemySkill(m);
            
            break;
        default:
            break;
    }
}

function enemySkill(m, sfx = sndScreenShake) {
    // used for the bulk of enemy attacks
    // takes attack and sound effect as argument

    // the textbox with attack name and description
    instance_create_layer(x, y, "Instances", objTextbox, {
        npcID: "",
        text: [
            $"{m.announcement}"
        ]
    });

    // future text and sound effects
    textBuffer = m.description;
    sfxBuffer = sfx;

    // set the damage
    var rand = random_range(0.8, 1.2);
    playerDamage = calculateDamage("enemy", m.coefficient);

    // set the alarm and stuff
    turn = "attack";
    selection = "enemy skill";
    alarm[1] = 15;
}

function enemyTurn() {
    // handle the enemy's turn
    if TEST { if (live_call()) return live_result; }

    turn = "enemy";
    
    // check if health is below zero
    if (enemy.hp <= 0) {
        dead();
        exit;
    }
    else {
        enemyMove(enemy.attacks[enemy.attackIndex]);
    }
}

function getColor(select) {
    // finds the correct color for menu options
    
    /*gmlive*/if (TEST) { if (live_call(select)) return live_result; }
    
    // attacks, skills, and items
    if (is_struct(select)) {
        if (select.name == selection.name)
            return #cccc00;
    }
    var str = string(select)
    var color = c_white;
    if (str == selection)
        color = #cccc00;  // darkish yellow
    if (str == string(attacks[3])) {
        color = #c61aff;
    }

    if (select == "item" && array_length(global.inventory) == 0) { color = c_gray; }
    return color;
}

function goBack() {
    // goes back to previous room

    alarm[0] = 1;
    audio_sound_gain(global.battleSong, 0, 1000);
}

function move(m) {
    if TEST { if (live_call(m)) return live_result; }
    // the player's move

    aCounter = 0;  // reset aCounter

    switch (m) {
        case attacks[0]:
            // overhead press
        case attacks[1]:
            // pulldown
        case attacks[2]:
            // leg press
            alarm[1] = 1;
            turn = "attack";
            break;
        case attacks[3]:
            // max out
            alarm[1] = 1;
            turn = "attack";

            // effects
            playSound(sndMaxOut);
            skillFlash("player", "max out");

            break;
        case "Scan":
            // scan the enemy for data
            var eName = string_lower(enemy.name);
            var stats = $"Health: {enemy.hp}/{enemy.maxHp}, `Strength: {enemy.strength} ";
            
            // get the enemy's description
            var desc = enemy.description;

            // create the textbox - get the description text
            txt = [ $"{global.characterName} scans the enemy!" ];
            for (var i = 0; i < array_length(desc); i++) {
                array_push(txt, desc[i]);
            }
            array_push(txt, stats);

            // the actual textbox
            instance_create_layer(x, y, "Instances", objTextbox, {
                npcID: "",
                text: txt
            });

            // sound effect
            playSound(sndUseSkill);

            // drawing effect
            skillFlash("player");
            
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
            skillFlash("player", "item");

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

function playerDead() {
    playSound(sndDeath);
    turn = "lose";
    deadY = 0;
    alarm[3] = 60;
}

function screenShake() {
    // make the whole screen shake!
    // man, I could really use a milkshake

    shakeValue = 3;
    if (sfxBuffer != -1) playSound(sfxBuffer);
}

function skillFlash(type, move = "skill") {
    // flash the enemy or player when using a skill
    var color = c_white;
    switch (move) {
        case "max out":
            color = #992600
            break;
        case "item":
            color = #1ac6ff
            break;
        case "skill":
        default:
            break;
    }
    if (type == "player") {
        pSkillAlpha -= 0.1;
        pSkillColor = color;
        alarm[5] = 1;
    }
    else if (type == "enemy") {
        eSkillAlpha -= 0.1;
        eSkillColor = color;
        alarm[5] = 1;
    }
}