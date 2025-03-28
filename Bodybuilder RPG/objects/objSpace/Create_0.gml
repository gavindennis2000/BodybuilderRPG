/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

// space background stuff
layer = layer_create(100, "space");
cam = view_camera[0];
spaceX = camera_get_view_x(cam);
spaceX2 = camera_get_view_x(cam);
spaceXStart = spaceX;
spaceY = camera_get_view_y(cam);
spaceY2 = camera_get_view_y(cam);
spaceYStart = spaceY;

// start the stage
if (instance_exists(objPlayer)) {
    objPlayer.teleport = 270;
}
else {
    debug("player doesn't exist.");
}

position = "start";
counter = 0;

// create the legendary items
instance_create_layer(192 + 32, 128-32, "Instances", objItem, {
    itemID: "nectar of the guardians",
    text: [
        "The Nectar of the Guardians is for casual lifters who aren't looking for a serious challenge.",
        "With this, you will have a near infinite supply of a rejuvenating chocolate-flavored beverage.",
        "Take the Nectar of the Guardians?"
    ],
    prompt: [
        "Yes",
        "No",
        "nectar of the guardians"
    ]
});
instance_create_layer(352, 128-32, "Instances", objItem, {
    itemID: "golden drumstick",
    text: [
        "The Golden Drumstick is for lifters looking for a solid challenge.",
        "With this, you will get a small stat boost to start the game.",
        "Take the Golden Drumstick?"
    ],
    prompt: [
        "Yes",
        "No",
        "golden drumstick"
    ]
});
instance_create_layer(512 - 32, 128-32, "Instances", objItem, {
    itemID: "trapezius of power",
    text: [
        "The Trapezius of Power is only suited for the most legendary of lifters.",
        "Despite it's name, this legendary item actually makes your enemies twice as powerful!",
        "Ironic isn't it? Take the Drumstick if you aren't already a seasoned lifter.",
        "Take the Trapezius of Power?"
    ],
    prompt: [
        "Yes",
        "No",
        "trapezius of power"
    ]
});