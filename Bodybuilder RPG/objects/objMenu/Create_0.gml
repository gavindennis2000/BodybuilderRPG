// handle menu stuff
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// create objcontroller
instance_create_layer(x, y, layer, objController);
selection = "new game";
screen = "menu";

hair = 1;
color = 1;

getColor = function(str) {
    var color = c_white;
    if (str == selection) { color = c_yellow; }
    return color;
}